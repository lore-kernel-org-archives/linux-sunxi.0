Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51646277CB6
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Oct 2025 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759305548; cv=none; b=FDj6NF3W3X0uxVLexLQH0ZEBRf9+dkxnFLgdpmP7xecE7gOgIENf5zM7X2+wASiGAJCgLLgIVzmNUsh3rdJjb0Au583GP2BSbQvDsNW1UJSP+7a+QGAz10UustqvTxY/3Gstlx8+94yRAonLwsw53iABqylTd+yCHKyh2UMGyGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759305548; c=relaxed/simple;
	bh=32+dcV5KCnlxSs5GB9v7s7dAz1V61Qe0s4V0xusvslI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxQ/3RKBjeqc+3ERN3ia5CJYnwtDg+iWAaqWy6QsXHfbNPN91HOVCV7v4nqm0t/qx85sgNjDFy4+qWElWXefQI3LTEWXPFGY4TOOtU5oaLjJ7EZQf+TKiPt+7ZieOymfbaVcj+tubLUvLfnsrWWazTGgirphXxkns7zBshEJAYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9IbUTfL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9IbUTfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759305545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6JRYgwl0T5IpgOuDkp0yF08iEAoUfTslJUqiB0DRs8I=;
	b=R9IbUTfL4xB9I5KgqSokOYTFzqZkaN5sYyaMftBvHjTnU96zRg6u4IPMTBnoTY5v2fvMEd
	sLM1V5w/nne1MfqdhX9mpvJL8yAq+FsygD2kK5QmAq9T8ffG91pu3VNX9Fg70CiHGCTcXJ
	FUU50YJ/feDoA+ttAoAFmfo/nnCwMUE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-3GdDJnUNOAyO91C6NtyVsw-1; Wed, 01 Oct 2025 03:59:04 -0400
X-MC-Unique: 3GdDJnUNOAyO91C6NtyVsw-1
X-Mimecast-MFC-AGG-ID: 3GdDJnUNOAyO91C6NtyVsw_1759305543
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3efa77de998so4124465f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Oct 2025 00:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759305543; x=1759910343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JRYgwl0T5IpgOuDkp0yF08iEAoUfTslJUqiB0DRs8I=;
        b=jR14V8FpeJuOUxJtbz5Objfe1Uq7FhqSHSynC739xokP2GZ0v0L1BfiIlDdryGFrOH
         knMfPhwLKvuaeJFBbxxvnSnGeNJi1xhC7AC63nKNbPLOqXhsbpM+/p4HUxi7VZJWFWga
         yOFHjmepuCe040opcN7ULina/9Yiy8CXgUJcsI94WyrB0cZKKx59vaE6uzuaTnr6dY20
         V88AoJjPyBCxXeUE8QpDFIfJ8QACozjV9k4IHrZxArjvUDz8BE8w3JlGzCLRGkAUXy0p
         cv3TIeFMKvQXOtzwZ29RxEu20voYKDHEi2j7Je6p1UNNNxfuYoMUITdWIo+3X15WV7Mj
         y4AA==
X-Forwarded-Encrypted: i=1; AJvYcCX+abB16P+9IfN+q6ERYnhbw78Cus2ZfevFJhuar+mD3HqxCU2uM399QPUgny+kZ7osi5wQ23xS7F6Gbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwM2gx0AU9nERjKAYBYkUTsXxzcDru+l2mAmMfagAenA2nf29fl
	uNiJ49kNuTRK7Dkssn65LmUy4Q4jKOadxYGk9maJ33vu2+KiigTQPcHwmp8keNglDpqSjkKUjgT
	aLzeYfD3OjCu0GAGIp7aQH/AytSLxIF4qJtLaEN0KIsvvrGU9Fj5A5nhIqBNBCKLz
X-Gm-Gg: ASbGncstIAZJzTgTkZSEWLhCrVd0sPVzVmPyj05II2Abqxq2zi9m4JDt8B2vwBrkEqF
	ZxQP8+n4eIWEtej/nO+sK1KpvCZk5tZGnA1oOUCgiYEyCQ8NsbaodddiLkZ1RAfNyA/OJLjEx/8
	NsvABCqxzsgCFYzeYHJTRAh7pLsa+I7pveml0Wwpz+TkpwK4hRyhSNPxzljJQONh+tgZ5IEhpxL
	BdEJ7esTdZxFFxmlXYzHV3zD9k2SdenUp0gY+hrdbZhIHiyBlEz5pXv+tzxdsDRhStKbvNjOKXX
	QxWUNOxkUz+gNFUHCWIljdOFSm4gHUV3vd9PS9ISnLsY92glREwp7p7db/ihLxr9j6toc25L1jc
	xmAwtWhaaxQuSiWas4Q==
X-Received: by 2002:a5d:5f55:0:b0:424:2275:63c2 with SMTP id ffacd0b85a97d-42557816e2fmr1739111f8f.33.1759305542750;
        Wed, 01 Oct 2025 00:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmThKjj9QWZgUZye0EGBRbRcpzbrXizq8/t5RuSNwiL8WkyRG5/i9RJlh4f2Y+zEs9wXkX5Q==
X-Received: by 2002:a5d:5f55:0:b0:424:2275:63c2 with SMTP id ffacd0b85a97d-42557816e2fmr1739074f8f.33.1759305542103;
        Wed, 01 Oct 2025 00:59:02 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619a6fc8sm26932675e9.13.2025.10.01.00.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:59:01 -0700 (PDT)
Message-ID: <a1f2c541-01c3-4c02-9caa-d061b1ec81f3@redhat.com>
Date: Wed, 1 Oct 2025 09:58:59 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
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
 <aNzc17ZW56gLX87v@shell.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aNzc17ZW56gLX87v@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7NSGEPaB0PwOMJw4y4Kj0xT2ip7cZTu0tY-PjJFdm78_1759305543
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/25 9:48 AM, Russell King (Oracle) wrote:
> On Wed, Oct 01, 2025 at 09:25:07AM +0200, Paolo Abeni wrote:
>> On 10/1/25 2:20 AM, Jakub Kicinski wrote:
>>> On Mon, 29 Sep 2025 18:08:04 -0700 Jakub Kicinski wrote:
>>>> On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
>>>>> The Allwinner A523 SoC family has a second Ethernet controller, called
>>>>> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
>>>>> numbering. This controller, according to BSP sources, is fully
>>>>> compatible with a slightly newer version of the Synopsys DWMAC core.
>>>>> The glue layer around the controller is the same as found around older
>>>>> DWMAC cores on Allwinner SoCs. The only slight difference is that since
>>>>> this is the second controller on the SoC, the register for the clock
>>>>> delay controls is at a different offset. Last, the integration includes
>>>>> a dedicated clock gate for the memory bus and the whole thing is put in
>>>>> a separately controllable power domain.  
>>>>
>>>> Hi Andrew, does this look good ?
>>>>
>>>> thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.org
>>>
>>> Adding Heiner and Russell, in case Andrew is AFK.
>>>
>>> We need an ack from PHY maintainers, the patch seems to be setting
>>> delays regardless of the exact RMII mode. I don't know these things..
>>
>> The net-next PR is upon us, let's defer even this series to the next cycle.
> 
> Would've been nice to have been given the opportunity to respond to
> Jakub's email before that decision was made. Not all of us are in
> the US timezone. (Jakub's email came in gone 1am my time.)

I'm sorry, the time constraint is very strict. The PR is already in
late. My message's goal was to give you the needed and deserve time for
reviewing the series, not to pressure you.

Note that to merge the series at this point I need to undo some of the
work already done.

Cheers,

Paolo


