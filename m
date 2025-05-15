Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A300E289E03
	for <linux-sunxi@lists.linux.dev>; Thu, 15 May 2025 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301033; cv=none; b=kL7HCq56sn+tr+rTSuGpdQe5xncX1RoqV1mTJqCqzMoA0SYuxQGj+ff3MEIJGOc5aFmxFaxx4ibYKzk+C3XYCG9u6iEpPzLhNfCVPU1Llvt9QS/HJ/xZuRoAYL0rdIG/H7sK9JE7+MHMed9TKji5ZecI5rHlppzB9PILFO/n2FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301033; c=relaxed/simple;
	bh=d6ylf5TABX4ADMorSqq9nRJZWTSWF5fEQuucEOnPCfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5DpVMwGs7qX6dqktAQbsr7lQxDnXhZddtfOWBlJg18SDiA5B/hK5AGrJtkV3c0lrR9Hl3Pa4cTSTXt8X4gpb98bLBUxK+g1KgfsqhertYcyuFJ3HQytnLtEPbSH6HCx/AiOZyUT2HY4XxtgrNIY9DQOiynG8RahS0VJ+h5ccJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4574A22FA;
	Thu, 15 May 2025 02:23:38 -0700 (PDT)
Received: from [192.168.166.64] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1322D3F5A1;
	Thu, 15 May 2025 02:23:48 -0700 (PDT)
Message-ID: <c3e6a5cd-3985-4e71-b2a4-742303836660@arm.com>
Date: Thu, 15 May 2025 10:23:34 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] add Eachlink H6 Mini
To: Shivam Gupta <gupta.shivam1996@gmail.com>
Cc: "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
References: <20250508143411.4534-1-gupta.shivam1996@gmail.com>
 <20250508162526.720c3649@donnerap.manchester.arm.com>
 <SJ1PR12MB6313678B38CB96D3C24FECE5A08BA@SJ1PR12MB6313.namprd12.prod.outlook.com>
 <20250508170507.3d426494@donnerap.manchester.arm.com>
 <SJ1PR12MB6313123CC3D9C79C9E51BF93A090A@SJ1PR12MB6313.namprd12.prod.outlook.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <SJ1PR12MB6313123CC3D9C79C9E51BF93A090A@SJ1PR12MB6313.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Shivam,

On 15/05/2025 07:44, Shivam Gupta wrote:
> Hi,
> After I extracted the fex file, kernel modules and DRAM details for an 
> old (previously undocumented) A10 tablet (https://linux-sunxi.org/ 
> Softwinners_crane), I am unable to proceed further with u-boot or kernel 
> compilation as it seems to need a dts. Can someone help me with this? I 
> spent many days trying to write a dts based on similar devices, but I 
> don’t have enough understanding of this.

So what did you try yet? I think the most complete A10 tablet in 
mainline is probably sun4i-a10-topwise-a721.dts, as this describes both 
the panel and touch.
You should copy that file, then go through it and check if you can find 
the respective settings in the FEX file.
For instance it looks like the touchscreen is the same, also using the 
same parameters like I2C address and interrupt, so you can keep that. SD 
card (MMC0) and UART0 also looks the same.
If in doubt comment or remove other nodes in the DT, then give it a try, 
to see how far you come. I'd recommend using serial, as this has a much 
higher chance of success or at least some output.

> The fex file can be found here:
> https://github.com/linux-sunxi/sunxi-boards/pull/72/files
> 
> Another problem I am facing is that the device boots from NAND by 
> default so it does not boot from my SD card. How do I get around that?

Are you sure? I think most devices boot from SD card if they find the 
right magic sector on it, bypassing internal boot media like NAND or 
eMMC. So what have you tried, exactly? You would need to build a U-Boot 
image, then "dd" that to sector 16 of an SD card. If you have serial 
connected, that should already give you some output, even without the DT 
being fully correct.

Please provide more details like the .dts that you created so far if you 
need more help.

Cheers,
Andre

> Please help with this so I can get something up and running.
> 
> Thanks,
> 
> Shivam
> 

