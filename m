Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9CD375F62
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703855; cv=none; b=joYtGFc5RmoxA0hmEXMCGjrFt5Ribb1EzsaYRQGZcrecns18CzMuzA0GYMAe58Z7BxjbVfs0JeTzo0g9o6H9hyIm5MJM4ebYjC3c0tYgI2VjLArFD7a71ZXPkhue78f6Ay2QrLxm7ZeK1JDEOmyenboy3Gu5CNTfluL/Z4nejBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703855; c=relaxed/simple;
	bh=0jH5znvxNnd1gWUS28cgmfAB8niis06uGR7xwFq0jo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBLhIXsYNtU4XPqu9v1sz4nG/WPglofUhcjvXGpktqCVEZQGNefdRUJ0Tp5w0XwVUEaidq0HtrQGSbRlJ3onx+z5feS/soX8j5ShdyEkeoC/H3LzHyscLdPNh6XFWEndukDBLZtrrsXhGVpAXdyhqxpuYRK2H3aM8hDq8MoPVBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KRWp0R58; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KRWp0R58"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 69DDA1A2CBF;
	Thu,  5 Mar 2026 09:44:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 408DB5FDEB;
	Thu,  5 Mar 2026 09:44:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58761103697F1;
	Thu,  5 Mar 2026 10:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772703851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qKbdSfvMKhaS1O9N44Ii5n4L97KLZKLOOIegRa3bjyg=;
	b=KRWp0R58lV8TzOHIuFGXEwGag71Epk/I1rydLhFdA4nYNpg6z6XFlCp5WTRQKSCwOyowDW
	eq9UdDia3F4XGD33ynxvtaS6sONv2v4oenFH4dNgSzrHS2ktq1ihJ6c4fXakTeBHSZzR0/
	rHS0EHA8XVIemkpmyFFXvWL6XBY+s4JEE04TqJskJxAhE9tmTH3VUhRM8tZijpo8kBf+v2
	1JQa2xxvO0rFMiaMe8eGjlClB35cTgniewKBs8UulOCTTwmHPOrB3OmEK7j65RxiKWWZ3J
	FkyQDGknn/lNlM7nmVYlnlxUB1uYCx3d7vqPDLnBESz60izKVvCMjDrf28c+xQ==
Message-ID: <5579e0f7-ccdc-4a39-9e45-f3a1296f448e@bootlin.com>
Date: Thu, 5 Mar 2026 10:44:08 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mtd: rawnand: sunxi: replace hard coded value by a
 define - take2
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-5-richard.genoud@bootlin.com>
 <13952574.uLZWGnKmhe@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <13952574.uLZWGnKmhe@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 21/02/2026 à 10:23, Jernej Škrabec a écrit :
> Dne petek, 20. februar 2026 ob 17:10:09 Srednjeevropski standardni čas je Richard Genoud napisal(a):
>> The user data length (4) has been replaced almost all over the file, but
>> 2 places were forgotten.
>>
>> The user data is placed before the ECC, for each step.
>> So, in sunxi_nfc_hw_ecc_read_extra_oob(), the offset of the user data in
>> OOB is indeed ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
>>
>> And in sunxi_nand_ooblayout_ecc(), the offset of the ECC chunk in OOB is
>> the same offset plus the current user data size:
>> section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
>>
>> Fixes: 1be7ac78b72f ("mtd: rawnand: sunxi: Replace hard coded value by a define")
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> 
> This doesn't really need Fixes tag since it's only refactoring.
Indeed.

> 
> With that said:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>


Thanks!
> 
> Best regards,
> Jernej
> 
>> ---
>>   drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
>> index 99d305bbda53..5d925b59b618 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -1051,7 +1051,7 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
>>   {
>>   	struct mtd_info *mtd = nand_to_mtd(nand);
>>   	struct nand_ecc_ctrl *ecc = &nand->ecc;
>> -	int offset = ((ecc->bytes + 4) * ecc->steps);
>> +	int offset = ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
>>   	int len = mtd->oobsize - offset;
>>   
>>   	if (len <= 0)
>> @@ -1747,7 +1747,7 @@ static int sunxi_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
>>   	if (section >= ecc->steps)
>>   		return -ERANGE;
>>   
>> -	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + 4;
>> +	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
>>   	oobregion->length = ecc->bytes;
>>   
>>   	return 0;
>>
> 
> 
> 
> 


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
