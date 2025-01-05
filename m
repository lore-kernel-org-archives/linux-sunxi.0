Received: from mxout014.mail.hostpoint.ch (mxout014.mail.hostpoint.ch [217.26.49.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75464C6D;
	Sun,  5 Jan 2025 12:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.26.49.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736081418; cv=none; b=FP5FtSsDDHEFZMJLrNCIfYmoyJTvrau0Yg3+l8EEEjwk6QhhXm5ltLBsEsR3WFUxUoq/vcLJrGuZULyZMPq++a7iSnO26uxFEXwUuBV7TXh+t5o5A6ZlTqQJB2R6zZsqSTmB/iVqZHSZB4iPpP28mv4exPu0peBjV1c8HfAD80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736081418; c=relaxed/simple;
	bh=cWIS7uvw25A16c6OgBTU/nWh6RaC1y2hqP+zDjIb6E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prxtJD030LdbA8neU/FAplF2AzZ5qY6KRz2MPp9OkRKi264CKjS1NN/vCS6RGF2ATG8QMXaOTtloiPwhqN3UylsNM6rH6TzH0ojipqQ7yc/2A+4ePwbnn/OgtZB7beboGpQaWjGcrnNjPLEZ7raq9gRkisyYR4oc0UsYEsXSmxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stefan-gloor.ch; spf=pass smtp.mailfrom=stefan-gloor.ch; arc=none smtp.client-ip=217.26.49.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stefan-gloor.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stefan-gloor.ch
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
	by mxout014.mail.hostpoint.ch with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1tUQ2v-000000005Vu-3aIl;
	Sun, 05 Jan 2025 13:47:57 +0100
Received: from [178.197.223.140] (helo=[192.168.10.76])
	by asmtp014.mail.hostpoint.ch with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1tUQ2v-00000000NLP-2Dvi;
	Sun, 05 Jan 2025 13:47:57 +0100
X-Authenticated-Sender-Id: code@stefan-gloor.ch
Message-ID: <d4cafa3f-d17c-4f80-bb30-98c28ede1077@stefan-gloor.ch>
Date: Sun, 5 Jan 2025 13:47:55 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: sunxi: Add MMC alias for consistent enumeration
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241219105622.13691-2-code@stefan-gloor.ch>
 <CAGb2v67dBhL3-AhLeHg3xOgbNZ3qu0aj9+kA+MoOMRYfr_Z_zQ@mail.gmail.com>
 <20250101232836.76c7fd0e@minigeek.lan>
From: Stefan Gloor <code@stefan-gloor.ch>
In-Reply-To: <20250101232836.76c7fd0e@minigeek.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Vs-State: 0

Hi Chen-Yu and Andre, thank you for your input.


On 01.01.25 09:58, Chen-Yu Tsai wrote:

> IIRC we have chosen against adding explicit MMC aliases for the sunxi
> platforms. Please try using UUID= or PARTUUID= for root partition
> references.

I see, no problem. Out of curiosity, what is the reason for this 
decision? I couldn't find related discussions on the mailing list.

Personally, I like the UUID= or PARTUUID= method and I do have a working 
Yocto setup that uses PARTUUID to find the rootfs. It integrates nicely 
with the automatic disk/uuid creation and U-boot using extlinux.conf 
[1]. I do however understand that this requires major changes to the 
meta-sunxi layer and the maintainers don't like breaking a working 
system with U-boot scripts. So I went with the easier way of adding 
aliases. For future reference to anyone, this patch has now been added 
downstream to meta-sunxi [2].

[1] https://github.com/linux-sunxi/meta-sunxi/pull/431

[2] https://github.com/linux-sunxi/meta-sunxi/pull/432


On 02.01.25 00:28, Andre Przywara wrote:
> Yes, and LABEL= would be another way.
>
> Alternatively you could use U-Boot's DT when booting the board. U-Boot
> will add those aliases during build time (because it needs them for its
> own purposes), and by using $fdtcontroladdr (instead of $fdt_addr_r,
> on the bootz command line) you get this for free, and even save yourself
> from loading some DT.
> We sync the DTs regularly from the kernel to U-Boot now, and at the
> moment they are identical between the kernel and U-Boot, so you don't
> lose anything.

Thanks Andre for the helpful tips. I'll remember this for future reference.

Best,

Stefan

