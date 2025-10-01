Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02C0238D3A
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Oct 2025 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759303514; cv=none; b=iToHHNylpbZ+YhI/NXV32vjSHUVf9jAgDB48QqMpFbCSXyQGg57e4v0FPQ0SXOwaga3Sx5olDkgCGY2aDq1F0WZmeUJ921+hT4ATygGxtratqmyejXiSjsm34WXXwhPB2AUafvUhXX3qAtFA6vq3DKdSA4Ji8spouQE+l7UoceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759303514; c=relaxed/simple;
	bh=r7NA1kRD7RYmpKkMZ5JqC1r1jYDj2NzCHIGDJwN0hGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SaqtO07LfywdOv5kW1mu2pv6w+oViT4P1bsjJrbFmQhpIqfNqejdjDA/I8NgSydYUH/vo9Dksikj4IZt8Z6Y4MncNF4YYqlKecjRS9Lvyx+Vj4OYvVexbMXUQLOB82uDuLjEeeWupHPpul4F6qTnswQEXHFWDi6pE4zwMcxncSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C+F8F5He; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C+F8F5He"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759303511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONrm520dkd+lQqlPmyPFU3y1WxiCuM4kiuFUCUUyuHc=;
	b=C+F8F5HevpZnOn9B0lg4Rc0jqnVn/dslS5/ZVH3NlMv1r5Znf6nF8xwphyiSk7ZqhabaJQ
	RwrUrCDbYYu62oqgaIaaUS9kclhQgx3oQqZvmk89ncFcBSsABRyd98NFXYtCwEoewkB0df
	I/XUsOGJmfD8rXCWDMJVR3CBtCi+/8Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-ApJ6XoE6Nj61AqIDsaCYwA-1; Wed, 01 Oct 2025 03:25:11 -0400
X-MC-Unique: ApJ6XoE6Nj61AqIDsaCYwA-1
X-Mimecast-MFC-AGG-ID: ApJ6XoE6Nj61AqIDsaCYwA_1759303510
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e4cb3e4deso1536765e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Oct 2025 00:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759303510; x=1759908310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONrm520dkd+lQqlPmyPFU3y1WxiCuM4kiuFUCUUyuHc=;
        b=b49uJOCNlce23v8VuNN4CKf4spiqE6VNR9dAmITr3yUP8G2FpKGwCcUrTCT+ghIvyg
         Hj9Ua/B2gAFQWzm7K9TNpBSdUjlmxBmb8OCN5tiVErHWkFeVY0m5CzBbKsrLJsIx8kx7
         rjktThgBxMPPdV/OUQ5PEuWWKPfbrn8j/vx2LWKKPoNtO9VQ0gfnF5fWT5PsvrgeR4DQ
         1MQy7ScohE6495h/i5CjmIj7tRi4UIfzy3h6JTgV5oYYtsMYpk9ktIJadm6YTdIo/u1a
         8gBgEdP2Gx9m6A4pctoHJa08HDyZfKvZYf1aa8RCeIV8xIfXGPqnV+ax4fKZra8+Oy/Z
         KxLw==
X-Forwarded-Encrypted: i=1; AJvYcCXglJY8/9OXbtapbRrGGV9yxPzwQubMaYb7DaemJO+enQEACTMwZ5eVxCGNurHElnFfs1sjFOCc5IsdTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzamTffMq4sWKky7bglr/yuKZCIHBVxplmYvONrfXWQtHjezzMA
	I6kzAvDFzvfrXrTIkEUgbM+0CXDE4xPVuOpbtA/riKgqyJJQ/m04QpqFmCHTwQNpyq57/uGibp+
	dgWiecMtUL3vhoqf/EIGaSBbsU5K/mMlpJbGcQOTrZCdAW7ga2LmNdsvzY4MhEJrY
X-Gm-Gg: ASbGncsam1Ow8dd6q8aj9jW+jTqxVNpi4UMc3/Yw39bVu/CRVdzOLF1NOAVAhEkFQjK
	cniQsdA7uGivWsJGniyLQba+uRCe+DkgHkD6Gx1gjn7CzruY0qimOg+5uokgwpGP/jn0DsnXAXR
	+TD0Mq/0eeuqrvDhzoo6A3CU3bjYLrC7ZZZ7Gq6WSCg70Sco2S1iBnjs9kxr/GirQmg3+EaVeMR
	kEWe+qvh/zZjaKQ/hJmoo4iwBjhghDbbY4MVOlyWebq8YpqZsYS7/uHkwpEyNT5qCJeCllHbnWk
	Jrh0bivt+OI9VTNrNIZeKW6FAngjru1/GZRjTHeWc7jsfBAIFqHlrg6ojJJxqUCr78Y6lZTNpPz
	v9CLq/VWoNoezJ5rkVA==
X-Received: by 2002:a05:600c:a210:b0:46d:e5bd:2ba4 with SMTP id 5b1f17b1804b1-46e58d16578mr35721415e9.18.1759303509721;
        Wed, 01 Oct 2025 00:25:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYANHEU4wHCl6KF8iSKnSJvFPjuGdoHZjMN7oYFUa7TE3yY0tBZuepifFCIEmjJ4HCuCIziA==
X-Received: by 2002:a05:600c:a210:b0:46d:e5bd:2ba4 with SMTP id 5b1f17b1804b1-46e58d16578mr35721095e9.18.1759303509297;
        Wed, 01 Oct 2025 00:25:09 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b8343sm25823335e9.2.2025.10.01.00.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:25:08 -0700 (PDT)
Message-ID: <d5aaff54-04dd-4631-847c-a2e9bd5ad038@redhat.com>
Date: Wed, 1 Oct 2025 09:25:07 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20250925191600.3306595-1-wens@kernel.org>
 <20250925191600.3306595-3-wens@kernel.org>
 <20250929180804.3bd18dd9@kernel.org> <20250930172022.3a6dd03e@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250930172022.3a6dd03e@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OXuBkafA9g8da3_DJF9rOqPnSK3RmCWY6rKni-4xEdw_1759303510
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/25 2:20 AM, Jakub Kicinski wrote:
> On Mon, 29 Sep 2025 18:08:04 -0700 Jakub Kicinski wrote:
>> On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
>>> The Allwinner A523 SoC family has a second Ethernet controller, called
>>> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
>>> numbering. This controller, according to BSP sources, is fully
>>> compatible with a slightly newer version of the Synopsys DWMAC core.
>>> The glue layer around the controller is the same as found around older
>>> DWMAC cores on Allwinner SoCs. The only slight difference is that since
>>> this is the second controller on the SoC, the register for the clock
>>> delay controls is at a different offset. Last, the integration includes
>>> a dedicated clock gate for the memory bus and the whole thing is put in
>>> a separately controllable power domain.  
>>
>> Hi Andrew, does this look good ?
>>
>> thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.org
> 
> Adding Heiner and Russell, in case Andrew is AFK.
> 
> We need an ack from PHY maintainers, the patch seems to be setting
> delays regardless of the exact RMII mode. I don't know these things..

The net-next PR is upon us, let's defer even this series to the next cycle.

@Chen-Yu Tsai: please re-post it when net-next will reopen after Oct
12th, thanks!

Paolo

