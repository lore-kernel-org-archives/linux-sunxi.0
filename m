Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24772E54BF
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Oct 2025 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290484; cv=none; b=FgqRUdriCLwuwDUXuo67oYMomk2NfbtOM7aioFy5NhXPHhcHs8tNU2WfSpvM5RG6UPaFrfrF1d/XFL3lNv/69Wo2YA/cEKIKU9uMhGvPyQhzUgOImF3rOrDMT53s2hX0lCC3CHSrOTuVZHeD8DomJYSqyeZqbOK3D/GTR52TxNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290484; c=relaxed/simple;
	bh=lcb3dVn0iym9zJMs4diWzppG9w2vAuX9XMaRZbiaA4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZduII09R0yI26+f7OAhBUJCJwOCIMBTUerjicIP9GvJwDlFv5U7d0Ex0viwV4JHXZ0XRa3kfbtZE7w0b5GIc8CuqqudmseXOOWmN3QlQicY9f/iPs0XtqwVE6qo03G6qYPR/9+eihczYUtff3bchuaJDAazSuZeKCQaZqlkrf/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=puPpxBP2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="puPpxBP2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 026101A1638;
	Fri, 24 Oct 2025 07:21:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4F6760703;
	Fri, 24 Oct 2025 07:21:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EB30102F244A;
	Fri, 24 Oct 2025 09:21:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761290478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=n2SfjqX6lNSkj1H/YLHGctb/htiBAD/kfjrbeKtoNe8=;
	b=puPpxBP2v/7GBLcTgiHZwflmwE+c7IIPgQnODmI+9FPa5WOXR1bQd1A8CnbxM3Q5gmoVsN
	W11z0YLDO+Hyl0+f1X0L3BRgUfkWUSA0Nk5meqcbJoQjvbpBVFLrkmhPMY5WtbbqkVsEBb
	g3D1EP4iu7g1a4P90Fi3n8fG/OTWe3/qunL0k9zXx3auk86Ki2ksYKvUxD6D1OCs3N/B+G
	kOfBP/AWnWTknh6ErkZfBhvn30fLexAoFDqVkvGnVnzcW1Ope7DSeuv1ahBltn9ngXH36U
	agAthTSviB78yes0nszNAjig8JoB75pyIOsYrn9m+byEn2fvIXgiWILHHQCr2A==
Message-ID: <f076f6a6-372a-41ff-a78a-48d1af4ec33d@bootlin.com>
Date: Fri, 24 Oct 2025 09:20:58 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] mtd: rawnand: sunxi: introduce reg_user_data in
 sunxi_nfc_caps
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-5-richard.genoud@bootlin.com>
 <87y0p3tiz9.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87y0p3tiz9.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,
Le 22/10/2025 à 10:54, Miquel Raynal a écrit :
> Hi Richard,
> 
> On 20/10/2025 at 12:13:00 +02, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
>> The H6/H616 USER_DATA register is not at the same offset as the
>> A10/A23 one, so move its offset into sunxi_nfc_caps
>>
>> No functional change.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   drivers/mtd/nand/raw/sunxi_nand.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
>> index 0285e4d0ca7f..8f5d8df19e33 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -48,7 +48,8 @@
>>   #define NFC_REG_DEBUG		0x003C
>>   #define NFC_REG_A10_ECC_ERR_CNT	0x0040
>>   #define NFC_REG_ECC_ERR_CNT(nfc, x)	((nfc->caps->reg_ecc_err_cnt + (x)) & ~0x3)
>> -#define NFC_REG_USER_DATA(x)	(0x0050 + ((x) * 4))
>> +#define NFC_REG_A10_USER_DATA	0x0050
>> +#define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
>>   #define NFC_REG_SPARE_AREA	0x00A0
>>   #define NFC_REG_PAT_ID		0x00A4
>>   #define NFC_REG_MDMA_ADDR	0x00C0
>> @@ -214,6 +215,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
>>    *			through MBUS on A23/A33 needs extra configuration.
>>    * @reg_io_data:	I/O data register
>>    * @reg_ecc_err_cnt:	ECC error counter register
>> + * @reg_user_data:	User data register
>>    * @dma_maxburst:	DMA maxburst
>>    * @ecc_strengths:	Available ECC strengths array
>>    * @nstrengths:		Size of @ecc_strengths
>> @@ -222,6 +224,7 @@ struct sunxi_nfc_caps {
>>   	bool has_mdma;
>>   	unsigned int reg_io_data;
>>   	unsigned int reg_ecc_err_cnt;
>> +	unsigned int reg_user_data;
>>   	unsigned int dma_maxburst;
>>   	const u8 *ecc_strengths;
>>   	unsigned int nstrengths;
>> @@ -723,8 +726,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
>>   {
>>   	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
>>   
>> -	sunxi_nfc_user_data_to_buf(readl(nfc->regs + NFC_REG_USER_DATA(step)),
>> -				   oob);
>> +	sunxi_nfc_user_data_to_buf(readl(nfc->regs +
>> +					 NFC_REG_USER_DATA(nfc, step)),
>> oob);
> 
> Minor nit, column limit is 100 now, so typically for this kind of
> situation everything would fit on a single line.
Indeed, the 80 column limit has been loosened (but braille displays are 
still 80 cells max AFAIK).
Anyway, you're right, the 80-rule could be bent here for readability.

> 
> Don't respin just for that if there is nothing else later, but if a v4
> is needed you can change it.
> 
> Looks neat otherwise so far.
> 
> Thanks,
> Miquèl

Thanks!


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
