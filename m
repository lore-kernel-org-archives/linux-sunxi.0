Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8CB154BE0
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Mar 2025 13:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742392581; cv=none; b=Sp9X3rfQ6z7TPUp+YbCJFlVmZVv90oB4YPE1pMFScS9ahpH9cqoMioqkIcJsWTwSK6u9wIDkefHqe1rmIxejYXCr5Jyx4LuLaCqHqdzg5uhr6FgCU8+X/fYWJuMHs5elDoEugPzY7YejzEuDCuwuopQy7ZKJ9iHwpWTbiW3VB00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742392581; c=relaxed/simple;
	bh=wUERKUtCo++5Q3qCdOJCRxG6khkWbH3+VqDgWlV9PvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmlVtAZ48VU9yb6P1k9HVnntjkgAzv0wtP7zvwFzdYx3/nUu6CFTgONqpqS2zAwcFI5qoKQY6LSOrZK2kQfId8J0Lrq49r46S2aT8Rk91NnD4iqYJutJQRaOJ3NYCyrnrpPO0wL3kuPjVzEB/do7rqWpO57n7w8DrDkm7dKaGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=QCnZgCLm; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="QCnZgCLm"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 744FD101E91CC;
	Wed, 19 Mar 2025 14:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742392569;
	h=from:reply-to:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=bTutbFYZrRA5du+iTJ+OA8vD6T9q8KAOn4cIwegpt0g=;
	b=QCnZgCLm4nQW/7QFPsO06TseGva+Y+07drSdRzm47H574XpSxIk28936ALKRAMI3y4yn1z
	N3FJXHjLGtVm5HIjhWUNY8hWVYPxltxfc4jmlCM/auOfY+b+bXLwPg03NNz1Fg+M6tBWQj
	kTfGL7H0c8sX52Hc/gY+lPaUGgLxqgOoZvmLvTku6KcXcVcjQS5QC8FMGXIF9FXvwEAi4H
	BKYtopE42ETUNe/GoOIBcBa2r15lfpRTyehnJ830sXmYVM4XhOd6wMdb3Yeuoms4Q7toT4
	z6Gau7ovQn0LMj+BWXJlgIG+8CXNQBenOebdUJ+L/eIn2B+OPWOldi5X2mxFvQ==
Message-ID: <77b1cc96-593a-9856-5d18-b4dba4d5ea6f@denx.de>
Date: Wed, 19 Mar 2025 14:56:33 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] sunxi: pmic_bus: Move SPL I2C addresses into Kconfig
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Simon Glass <sjg@chromium.org>
References: <20250318003943.6714-1-andre.przywara@arm.com>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <20250318003943.6714-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Andre,

On 18.03.25 01:39, Andre Przywara wrote:
> Some of the X-Power AXP PMICs can be ordered with an alternative I2C
> address, for instance an AXP717 could be shipped with address 0x34 or
> with address 0x35. Similarly the AXP803 lists two possible addresses.
> For DM (DT) based drivers this is no problem, but the Allwinner SPL
> code relies on exactly one hardcoded address per PMIC so far.
> 
> Add a Kconfig variable that holds the I2C address used by the PMIC
> accessed in the SPL, and provide the (mostly only one) supported address
> as its default, for the PMICs we use. Boards using the other address
> can easily set this in their defconfig.
> This effectively moves the hardcoding from C code to Kconfig.
> 
> That enables to use the AXP717 on some boards with the new Allwinner
> A523 chip, which use the other I2C address there.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   arch/arm/mach-sunxi/pmic_bus.c | 27 ++-------------------------
>   drivers/power/Kconfig          | 10 ++++++++++
>   2 files changed, 12 insertions(+), 25 deletions(-)

Thanks!

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
