global class Schedular_class implements Schedulable {
    
   global void execute(SchedulableContext ctx) {
    AccountBatch accCls = new AccountBatch();
    database.executeBatch(accCls);
    
     }


}