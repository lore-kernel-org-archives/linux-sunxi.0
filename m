Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634213;
	b=ek4BXISsa8bgakieJu6sC007y0pzkfnP8e8mY1J1V+G24GHeIPQCIrAseTcRzYXB62AR
	 i+vKAdPlvkoy1I49ybebRJ7Yzm0TPX0R6mLyLGFWZT1UP15r3vk7I2/xX5fyFAsZVxtXq
	 CeBkNRksRBKEJbTfQyYrwQA13J9arJkgQ70hIStKJz2/gYZYYOaIPrfUxB9IumVpierXc
	 cbju+9Eisfz58yIHVXYAt7vW9nnhoqGyexvHMr3SCj3pqJIZixYi6L/oiwm8G8bJBbl7o
	 x3evHqunFcTmAvYcZox7BLKd8bPGayR2Scaorjp8BHd8wG3tkhawd/V4oW+DHYM1k1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634213;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=f4rms8U7zLHCSMuZUidm8eBtD75JSPsJZXcDQYSok00=;
	b=gSMMy1VE2/Be0zLBYZ5mSFlOn6RijdVC4kZeSEyRlRoALLpis2QPfMHHzqgdRQYYAO0s
	 IkH5mOkDida7i9+NF+26PLGuLrypdD7qSdP9uGimIXI+qyOir6s/UNbzKyt2uqraOdN6Z
	 5IJuDLVLnnYcl2N2tMTpF4CoJndQUrvs1VwKsjxiWxoKBcCM9Gx39sZCku3n2Q02fHqdZ
	 tuVZjph/RkKob5C9WJ9cLE/EbEUs7nXr7iCAXLkX59TlVdvEvobmhFuURWZdriZGVZTkv
	 AalYHY9FHjgqktW7hgZMZ0qzgcKyA5sb2/Qd2FDBA91fOs6PZlJFrVzyDXK2vguOyiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q9afwz7J;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C3E606D80F
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 15:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C3E606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q9afwz7J
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D50AB1691;
	Mon,  2 Nov 2026 07:43:28 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C7E73F673;
	Mon,  2 Nov 2026 07:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793634211; bh=LoDP/ozuXN4coqSNOir7+A9+NIl8WuJukf+q/Sdudu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q9afwz7JF+IVBEa+kEt0naITPT47mOKEfUBRn2m8LknqoOVM21B/2+C5xRjxu8p35
	 TYJaEzhhQsUBz/z/c1moKyRP6rC0sgIKlwuq4EcGA1bUuYAQN9DOe/uFwBiq+Wm/tV
	 lkZ1+jCuc3IhDePlC8FGQb3xoCGIVihy5RI8Tdlo=
Message-ID: <b63fb278-6d75-4bcb-a23f-abe80edf2837@arm.com>
Date: Mon, 2 Nov 2026 16:43:24 +0100
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Enzo Adriano <enzo.adriano.code@gmail.com>, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
 <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
 <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vinicius,

On 10/28/26 19:09, Vinicius Pedrosa wrote:
> Hi Junhui,
> 
> In patch 6/8, usb2-u2-ref is declared as a plain mux, but the manual

can you please reply inline? Copy the original email, then reply after 
the code that you have a comment on? See the other replies on this 
series for examples.
After all this is the reason we do this patch-inline-in-email approach 
for review, so that the context is clear, and makes it easier for the 
author, other reviewers and maintainers to follow the review comments.

Subscribing to the linux-sunxi list is probably the easiest to get the 
emails, or use lore to fetch the respective emails. For one-offs you can 
also download the mbox file from lore, then import them in your email 
application.

Cheers,
Andre

P.S. This applies in general to your email replies, I see them as 
completely from scratch text, just with the right In-reply-to header, 
but without any context.

> has a gate at bit 31 of 0x1348, and its reset value is 0. So the CCU
> driver can't enable it.
> 
> -static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents, 0x1348, 24, 3, 0);
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents,
> +                                    0x1348, 24, 3, BIT(31), 0);
> 
> I hit this on my Cubie A7Z with a USB stick on the DWC3 port (the DT
> and the USB2 PHY driver for that port are local, not posted):
> 
> - v6 as posted: 0x02003348 stays 0 and the DWC3 soft reset times out
>    (-110), 4/4 boots, one of them cold.
> - same kernel, only bit 31 set from U-Boot: the host works, 3/3.
> - with the change above: works, 3/3.
> 
> Same DTB and initramfs in every run. The SerDes gates were also the
> same, so I haven't checked whether they matter on their own.
> 
> My boot chain (U-Boot SPL, TF-A, U-Boot) leaves bit 31 clear. I don't
> know what the vendor one does.
> 
> Thanks,
> Vinicius

