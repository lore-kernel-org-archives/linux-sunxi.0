Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FD9258CD0
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Oct 2025 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759305966; cv=none; b=uhHZVgu/d3kZjxZc/QzT1sWlrMmG8sJCVYOgYLYqe4ghJvuyLRx47eys0Zqn8y/PMGJ/JVZrUnzL+PTr1Ja+d9ohbli2YLOO6jrR8EF3bvyjDc7Ai2TgfP2JZMECcwyDfOhArtiOvn1g7l9q+wnDeY1fYpj9HXh5+cyWv1os7+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759305966; c=relaxed/simple;
	bh=5haNAEiXLgQzh1JAlqW9TjWwiFhiqV+0nJNKffjfNHQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=oa8w0Ab2T6G2oW4tfr6ARRKdE9a0WGRpB50jK5kj2fD3ltPFzcJarjQQy+J6NJcu7wFiit4Nt48za9MidX4eUvjLRyBwbUFBt+h6RNiHab1UeeQeQyxoApa71B/wQfmX6Y1QlmUhkH+li/jdblaV6bTOcQGVlSZySrRKStfqNwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RYFQvCgB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RYFQvCgB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759305963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTb+HR144WzaCHAGjWTq7YSgDtzJUyYbacPJ6jqxs7k=;
	b=RYFQvCgBjvCWTmhmfO/Zp0FOLy7LUsBpTSlTXh554mEkorTULdlw9ZIY2hjQRR6//lwhQ7
	b46x26+aN6YKsm2iGaYeG/abR7LdruBNYFtKQJSjSHaO0MJ+7CaeNaqVZktiLcWOVb677G
	26CrlheO5qw8Ze+v+OfeyI81cVq/fng=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-rHgE3WJqMrOc3CKrHGDtng-1; Wed, 01 Oct 2025 04:06:01 -0400
X-MC-Unique: rHgE3WJqMrOc3CKrHGDtng-1
X-Mimecast-MFC-AGG-ID: rHgE3WJqMrOc3CKrHGDtng_1759305961
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e3d9bf9e1so28731515e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Oct 2025 01:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759305960; x=1759910760;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTb+HR144WzaCHAGjWTq7YSgDtzJUyYbacPJ6jqxs7k=;
        b=HF0Z/l+Vk4rm7IC2rCH9tKcsc6MumpDxNeAyRDhlroMbW8yOzR2TrTZGsCbqEIP8Ce
         LTHMugJFZAAyJtfezjQ+wdW3bjQXGExIggNHscfTsH5Vie692PLVCCRnXMzGbNoJtGM9
         lGjud2Z7wqzwmIA4d14FvOjt8Jj/XEChhjJf+icEVh/GwiE0VDQJ1UlCT/+UFwGsFdqI
         88GizA0z4VvDTbzEdEPGS/s5OvDedbKjf5A0hsKqM0VfCmOAPrLKT3RTpqMxibvn/KbD
         ax6sP04LCIPPkafK0JdTzyZlrlPMOKTzsMMImy0L+P2M/Ah3KlZN1xt37NV+28b3i9FS
         LqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjRFYMOVm9MUW14+bccYOyZgrQcp8kDCpWJDQKkhS+WcRW9B/OCb25zMt6ETFfQX60N1n/8CavNm2f3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzEA6OrDLKya+vZY1R7XyRm2Grc3TqJahCoZWgUaxfsz1B53+S
	Izo/MllsmLgdQRysxpOOlzqwjto09Y3IohHZETJHJ3sN9i+Hw7TOTgpI/AqQJRMu+ep5vpZ7YoV
	69S5frCEMVYHzkESbCdNDEh46Nr4KOaTF0Teqk8Sf21TLwUq+RpVPp6E57OPW4acq
X-Gm-Gg: ASbGncttPIPPN5x5j6XX3SimAqo6/YssqiiBvYQkfeHBIisN/gXNWi9CtBproW0aDxB
	faspZ2jXYeAvfxQAf8Jmrftp3WWEOnPBVk8N/8YZGUcF5ByH9wuJg75Tm4ftgpdKad61hXi9I8J
	PQth8QMqesaLfGZjDhAh2Spz8NUhYs5VXf7swE/Zkq27fiOm0KgxV57PIQS6cJWNGt4XpmF64oQ
	H+dpZ6TmYB/PPMfBFLH4YVn4h1xYdJOKDgQAEoGeUZmoyu0/bgl1x7tdGnMFP8bLAHfhD61Wsja
	DuL+AI1G7fXZO9s3yskfaJWXHaWZu7QC3LSMblkraGix3btCp0+kSz7gO+iY8Ki6eF2y50DOTTS
	sz2AqhqiZldB7VAAEbg==
X-Received: by 2002:a05:600c:a404:b0:46e:6339:79d1 with SMTP id 5b1f17b1804b1-46e63397ae5mr11782825e9.5.1759305960538;
        Wed, 01 Oct 2025 01:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK0k0YsqKjJ0KQb6IWjzPtVVlPN29UZlYbY/QuFx9mxVtSijrKT1lChFjdgZCBijgjZoxIGg==
X-Received: by 2002:a05:600c:a404:b0:46e:6339:79d1 with SMTP id 5b1f17b1804b1-46e63397ae5mr11782525e9.5.1759305960082;
        Wed, 01 Oct 2025 01:06:00 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c44bd75sm30723575e9.4.2025.10.01.01.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:05:59 -0700 (PDT)
Message-ID: <02355e42-9b63-4ea5-a75f-0f4e20323379@redhat.com>
Date: Wed, 1 Oct 2025 10:05:58 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
From: Paolo Abeni <pabeni@redhat.com>
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
 <d5aaff54-04dd-4631-847c-a2e9bd5ad038@redhat.com>
In-Reply-To: <d5aaff54-04dd-4631-847c-a2e9bd5ad038@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 93FnIiAe3gpMQKw98yPVLEv1AOl4F-LiWhccNdYM39c_1759305961
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/25 9:25 AM, Paolo Abeni wrote:
> On 10/1/25 2:20 AM, Jakub Kicinski wrote:
>> On Mon, 29 Sep 2025 18:08:04 -0700 Jakub Kicinski wrote:
>>> On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
>>>> The Allwinner A523 SoC family has a second Ethernet controller, called
>>>> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
>>>> numbering. This controller, according to BSP sources, is fully
>>>> compatible with a slightly newer version of the Synopsys DWMAC core.
>>>> The glue layer around the controller is the same as found around older
>>>> DWMAC cores on Allwinner SoCs. The only slight difference is that since
>>>> this is the second controller on the SoC, the register for the clock
>>>> delay controls is at a different offset. Last, the integration includes
>>>> a dedicated clock gate for the memory bus and the whole thing is put in
>>>> a separately controllable power domain.  
>>>
>>> Hi Andrew, does this look good ?
>>>
>>> thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.org
>>
>> Adding Heiner and Russell, in case Andrew is AFK.
>>
>> We need an ack from PHY maintainers, the patch seems to be setting
>> delays regardless of the exact RMII mode. I don't know these things..
> 
> The net-next PR is upon us, let's defer even this series to the next cycle.
> 
> @Chen-Yu Tsai: please re-post it when net-next will reopen after Oct
> 12th, thanks!

To be clear: given Russell's ack I'm applying the series now, no need to
repost.

Thanks,

Paolo

