-- Problem 1:
select BuildingID, BNoOfFloors, MFName, MLName
	from Building, Manager
		where BManagerID = ManagerID

-- Problem 2:
select MFName, MLName, MSalary, MBDate, count(BuildingID) as BuildingsManaged
	from Manager, Building
		where BManagerID = ManagerID and MSalary > 49000 and MSalary < 53000
			group by MFName, MLName, MSalary, MBDate

-- Problem 3:
select BuildingID, AptNo
	from Apartment A, CorpClient C
		where A.CCID = C.CCID and CCName = 'WindyCT'

-- Problem 4:
select distinct A.InsID, InsName
	from Inspector A, Inspecting B
		where A.InsID = B.InsID and DateNext > '2020-02-01'

-- Problem 5:
select ManagerID, MFName, MLName, count(BuildingID) as BuildingsManaged
	from Manager, Building
		where ManagerID = BManagerID
			group by ManagerID, MFName, MLName

-- Problem 6:
select ManagerID, MFName, MLName, count(BuildingID) as BuildingsManaged
	from Manager, Building
		where ManagerID = BManagerID
			group by ManagerID, MFName, MLName
				having count(BuildingID) > 1

-- Problem 7:
select S.SMemberID, SMemberName, count(AptNo) as ApartmentsCleaned
	from StaffMember S, Cleaning C
		where S.SMemberID = C.SMemberID
			group by S.SMemberID, SMemberName

-- Problem 8:
select distinct S.SMemberID, SMemberName
	from StaffMember S, Cleaning C, Apartment A, CorpClient CC
		where S.SMemberID = C.SMemberID and C.BuildingID = A.BuildingID and C.AptNo = A.AptNo and A.CCID = CC.CCID and CCLocation = 'Chicago'

-- Problem 9:
select C.CCName, R.CCName as ReferredBy
	from CorpClient C, CorpClient R
		where C.CCIDReferredBy = R.CCID and R.CCIndustry = 'Music'

-- Problem 10:
select distinct C.CCID, C.CCName, C.CCIndustry, C.CCLocation, C.CCIDReferredBy
	from CorpClient C, Apartment A
		where C.CCID = A.CCID