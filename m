Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DE935AC35
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Apr 2026 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025287; cv=none; b=f/qD+mm+MMZFBBOsMn8Y/55SpTxoa15QJSqAfaMvf8T50y/kQiEQBGVUjZiFXygALzNU04fyYJqNRIzLmznHNZn+joUYocLEDmQI2F8vqFUQOEebH8hEE6/Cnr31jUCrQ52o3B5ETP31gFRXtM6i9VBZb8tDw+NRhx8nHKfZu4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025287; c=relaxed/simple;
	bh=SbBtKdvecJNSwNsIu9fwSaPmTiuHeUgjBl16QLaNXDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=IpN0f+nDLN0bJ9iRZn5NQr65XHphN6RdtGDRX4quJeKy2c3EYRVlEij6EFei71IwxYIYueeKjvsgm85ZN9SotGqADT1YoDt1JBTJ/RGccExL5JjOcN729q3/eJC0WYuy8hGvhUNgvOvhxzOtwEg4qhNwtHpaIYM5p0r+gjmsyvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bNLGlNlL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bNLGlNlL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFC5C1BC0;
	Fri, 24 Apr 2026 03:07:58 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBC523F641;
	Fri, 24 Apr 2026 03:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777025284; bh=SbBtKdvecJNSwNsIu9fwSaPmTiuHeUgjBl16QLaNXDw=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=bNLGlNlLenms3Rg6MYwszQybS1eJ4T/kPl8noJRsjZW731Jg3lm7bmXOFQibACB2p
	 OW7krUN8mYvgJIicguutB8GGVm1lou7DlCK9tEib8ORMt8oBYCyO9cUsgx8vTwnqpl
	 7milORFwTjyFvd+JNbjgUwcckWfWqlVuDutlZehQ=
Message-ID: <2e17130f-0bc4-4f76-a793-546aed49c9e0@arm.com>
Date: Fri, 24 Apr 2026 12:08:02 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: new A64-OLinuXino revisions
To: Roman Riabenko <roman@riabenko.com>, linux-sunxi@lists.linux.dev
References: <a20042b7088df2182121445368fce8fb4d129d46.camel@riabenko.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
Cc: Stefan Mavrodiev <stefan@olimex.com>
In-Reply-To: <a20042b7088df2182121445368fce8fb4d129d46.camel@riabenko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Roman,

many thanks for reaching out!
I take it you are not directly involved with the vendor, but since you 
are here, I am going to ask you all those questions ;-)
CC:ing Stefan, not sure this still works, his last mainline patch was a 
while ago.

On 4/24/26 11:25, Roman Riabenko wrote:
> Hello.
> 
> The vendor revised A64-OLinuXino and released additional devicetrees.

Well, "released" should be done via sending to the kernel mailing list, 
getting them reviewed and then merged. But well...

> Mainline Das U-Boot and Linux support revisions C and D. However,
> revision E and later require the vendor devicetree files to operate
> properly. For example, RX delay is required for stable download. There
> are also changes to voltages. Vendor's local changes to the kernel may
> need to be considered too.

So does one vendor devicetree support all versions? Or do they patch 
something, either when installing or at each boot time?
Do you have any board of older revisions, by any chance, so that you 
could run some tests?

And do you have a list of exact changes between revisions? Is there some 
changelog somewhere on the Olimex site or repo?
Also I see that the Olimex OSHW repo lists revisions up to H already.

> The vendor u-boot repository has old devicetrees only. The vendor also
> provides a single customised Debian image for all A64-OLinuXino, which
> does some initial board-specific setup at first boot.

So is there a way to detect those revisions? There is precedence in 
mainline U-Boot for patching DTs on the fly for board revisions, so we 
could apply required changes there. But we would need some way to check 
which version this board is. Are there some GPIOs or so for this? 
Sometimes there are other means of detection, like SPI or I2C device 
presence or something.

> I would like to start a discussion about how to have these changes
> mainlined.
> 
> For your immediate reference, I attach the patch obtained from the
> GitHub commit changing devicetrees.

So this one seemingly ignores the mainline devicetrees, instead installs 
their own versions? I would have hoped they would at least adjusted or 
included the mainline DTs ...

Cheers,
Andre

