public with sharing class OppsChartController {

    public OppsChartController (){}

    public List<OpportunityData> getOppDataWithMonthNames() {
        AggregateResult[] result = [SELECT SUM(amount) monthlyRev, COUNT(name) noOfClosedOpps,
                                    CALENDAR_MONTH(CloseDate) month,
                                    CALENDAR_YEAR(CloseDate) year
                                    FROM Opportunity GROUP BY CALENDAR_YEAR(closeDate),
                                    CALENDAR_MONTH(CloseDate), stageName
                                    HAVING stageName='Closed Won' AND
                                    CALENDAR_YEAR(CloseDate) = 2011];

        List<OpportunityData> oppsData = new List<OpportunityData>();
        for (AggregateResult a : result)
        {
            Datetime d=Datetime.newInstance((Integer)a.get('year'),(Integer)a.get('month'), 1);
            OpportunityData opp = new OpportunityData(d.format('MMM'),
                                                      (Integer)a.get('noOfClosedOpps'),
                                                      (Double)a.get('monthlyRev'));     

            oppsData.add(opp);
        }
        return oppsData;
    }

    public class OpportunityData
    {
        public String month { get; set; }
        public Integer noOfClosedOpps { get; set; }
        public Double monthlyRev { get; set; }

        public OpportunityData(String mon, Integer noOfOpps, Double rev)
        {
            month = mon;
            noOfClosedOpps = noOfOpps;
            monthlyRev = rev;
        }
    }
}