Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7707536A036
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 07:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818155; cv=none; b=tbOckr4aVEVP+DTT7y9PBeGdy6rz09mHqrxCHmJhzbFvFsBUAr8Qx11H+56ybpIzWhCjOJNtWrg4oZV7lSlNtFWm1ilr3N7apPrKtOH2LfFToeYElTbcZmE6hVOrHZo+dT5wuZUFCCMXfasQoQQg3X/28u4hMKaTA9z/U/62OpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818155; c=relaxed/simple;
	bh=5pvdvLvDF6nBad9lMPLtr5giq72Pgbs1flIwwqIgVTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KiLuVD7lyj65gUcTUnnQI+XQtlgFqDlIF2pD2VOM1avn4zNwATAvIoCSaznan9R18p4AupE/5np42WXpd9v0kBEaKQ+w7VPV817bLGnUQWmRcVNsH9dL6vAo5VDQPvFSm4MbOMFZx82W8f7NmDv+4p2QsWMNdaKxwG2KtjX78mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MVz6+6Fr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MVz6+6Fr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 211FA1A2E95;
	Wed, 18 Mar 2026 07:15:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9D3E6004F;
	Wed, 18 Mar 2026 07:15:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBCEF104506E6;
	Wed, 18 Mar 2026 08:15:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773818134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=f/wnit4uOPVq9r5YYUpYnHPITSDBvtEYXdALfE4LR18=;
	b=MVz6+6FroWlHDW6mHXGBgHiCJxCjhwZKsOAGUkwiONmck9b4YySN1cTUmfcih1U2tnoXMu
	OfOKaONHfmMdsmNqeYxN9hXpuZ4ZWGFdSNTzBZfORX8abPOwIoNCN8P3Klxz93J8LDBtpY
	aZ8WeKwHGUL/pzZh2UVvDjsJ1pAfbPgSXTnAQHMsQ3faY/PKQdBJrJWHiQ5X/OQU5oI9Ek
	omix2N/SK9A5WrXMoaK/cZXLXrwoqFxTLLHH8mRQ+K0l5lCfolJCTtbqQnSSHeTh3TM6GT
	hZI0PbR/WSGzlfmH8mXtT5SwuiAuZuxRYhWhV6HOLWiXYTKSnINke3xRo475MQ==
Message-ID: <9c9d7aea-0227-491b-92d4-5cc4d142e1de@bootlin.com>
Date: Wed, 18 Mar 2026 08:15:26 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free
 code clarification
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
 <20260317142437.580204-2-richard.genoud@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20260317142437.580204-2-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 17/03/2026 à 15:24, Richard Genoud a écrit :
> The available length is really USER_DATA_LEN - 2 instead of just 2 (the
> user data length minus the BBM length)
> USER_DATA_LEN being 4, that doesn't change anything now, but if
> USER_DATA_LEN changes, it will.
> 
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Sorry, I forgot to pick-up the review from Chen-Yu in v2:

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>   drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index e66adfcca7cd..915f1240546f 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1755,12 +1755,12 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
>   
>   	/*
>   	 * The first 2 bytes are used for BB markers, hence we
> -	 * only have 2 bytes available in the first user data
> +	 * only have USER_DATA_SZ - 2 bytes available in the first user data
>   	 * section.
>   	 */
>   	if (!section && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
>   		oobregion->offset = 2;
> -		oobregion->length = 2;
> +		oobregion->length = USER_DATA_SZ - 2;
>   
>   		return 0;
>   	}
> 
