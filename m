Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD9195
	for <linux-sunxi@lists.linux.dev>; Sat, 31 May 2025 00:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748651079; cv=none; b=JUukki3MX1T9Nrp0ON74/gbf7R1B4dirzwVAeujuVJxt+/HoNoEGky5Yku7PMsjvQFPV0mD3dhIH7UXJoXLPztE5Zyc7nbRDqW+YjAWcW2q5apEIGhob+eqs+kBdQAgUYaQJ+45KlXaUtrbDq5kGAgWNqo1DLkGUgYym1Gw3w2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748651079; c=relaxed/simple;
	bh=kdjY5G68O/RRWuFyUIE57CZllkCraz+Vj3AUv2+NaSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUX8arcJuMvY/6VBOjJ+RQNCv2Hbijjo97I8MGTTJwF+9ZU7n8ZPEyVu+6fkTG35zhAiYEq5a9DYRoVjnJaMn1zqdccNB2XqOq22OM4cUeguG8fvzAt8CoMvVi4dLogUVAnaU89mlLfQoOiv1xQqrgNO5utmFfmnllOkcLZnpn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXB02Xm3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXB02Xm3"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1995602b3a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 30 May 2025 17:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748651077; x=1749255877; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ4CEjhtCsMEo3sQ6MMn2NqLJYvOFiif6cKeN6zOFkg=;
        b=JXB02Xm32USJvv4I+tEclL58yj/RTxDvbvTp2dQA5Oqbz4h+L8zKiMYhfa0pIXh2SK
         V/3LSpYD4hvUO/EuDpv0uCrphcfBDRFFcCkH6+DAiU2+qks/K69bFxXZPDaATjemx1ju
         75AfuwSKEx3+AqBQ5BcXEA5Linn1mcYCw3CIT7GzHPvh8QDPbgiPcAokX/cp73MSFc4f
         ZgTleQ+gUIVQMLEmGlHgvvfN65uSldav+Dp0jbAyrRfgWSl9F/0ST+3/XyQJ9+t0iyTA
         WP4JCsck+X+k4fX7pIYGS8J/l63y9j5GbP4xwTjYTJsagv20B0Li817IXeE9UR96P8BW
         fItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748651077; x=1749255877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ4CEjhtCsMEo3sQ6MMn2NqLJYvOFiif6cKeN6zOFkg=;
        b=L4Od/XSRFGJbeIrzA7E16YAMeMwYJ0eK3++33j++5OTb5SQP/SHa3KKGJW67A643rV
         S4uIag0UiAAcit66HtoMAiwFhyl6HgxvB40NyUgr/vO7o6n6kM+ru7SNHc8qQt3Ttcub
         mxTMNCywv+9pAo7maC3IXKRDM2P3uAsdwgCPGPAsTf41fK6rRuDWpWI7+bsEAGZJ1X4p
         nySvswKcV0rKNQHKnqjLtS+Lg3ADhrMY0aV4xgkZ2YCcjsffD4AXHY/pJbavXpDPycTt
         1SKZOzkOpEqH8Jr+l+gOvevvL7clZ8CNpkQKySG8AWdk3zkgTQBPHg11uwVH9HZHrEiQ
         yiWw==
X-Forwarded-Encrypted: i=1; AJvYcCXHQSPUT2+WNgnrumqFHVdnAhY5aGpFPkpK2pxOrrkarLFzZVwIK2p18IKdJtnOTubVdF5ocPKqTIpxVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd5A0XwuaQmVStSBic0IJWl3z7Xlmi1Uqf09R8ASEjuVTbui1D
	xBTLvv65woxe5shCaFvegwN2Kg7FRtwy/RIYPXCbYG7/eU3JpY2xPB6j
X-Gm-Gg: ASbGnctY0Xi/azIs//gfooR6rJWt/lAg8nQClOxClAD3cFoFJOEXMTNuzNdjPEn+oee
	+n/dgd0xt7UV00IhrmO99nkRZcrxwO/QF7vC6p/aAK9QxJoGcwzCsTRrwTqAOr56W5ZZAuX0+8e
	fNrUhvW/1zvCQIbhiP2rcjPDSDrR4iWJeq18mly/ZpCDNzTNfiAL4Cf+EHSRWNtJoIj+WKSjTH0
	5p5MscrGPLLclsGvavdOkq/WLMhflQYuZQ1tUkDc3nsSaJDdHpS+evkdcjhDrArT045NsQZtwHf
	yJEL4UdJ7Y7KLbjMPzaY/dHPC+QiFCIyzdvC0bFS52K66oBfCoM5kCZSOy7t2KqzSp2FOcLL3Ap
	yA58mDeBZLGPM6fxlZaX9rAaR
X-Google-Smtp-Source: AGHT+IFDfpYHHpHeHr4rwGfSLVFcV+747OCTV1m4KHfob0XclD4SaKP/MqNM1dE9b/Hm/BcBa5/D9g==
X-Received: by 2002:a05:6a20:7484:b0:218:5954:1293 with SMTP id adf61e73a8af0-21ad97f95b5mr10118656637.34.1748651076822;
        Fri, 30 May 2025 17:24:36 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafb51sm3601133b3a.120.2025.05.30.17.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 17:24:36 -0700 (PDT)
Message-ID: <f5461b58-79ad-40b0-becd-3af61658bf61@gmail.com>
Date: Fri, 30 May 2025 17:24:34 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Furong Xu <0x1207@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
 <e1f4e2b7-edf9-444c-ad72-afae6e271e36@gmail.com>
 <CADvTj4oSbYLy3-w7m19DP-p0vwaJ8swNhoOFjOQiPFA24JKfMQ@mail.gmail.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <CADvTj4oSbYLy3-w7m19DP-p0vwaJ8swNhoOFjOQiPFA24JKfMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/25 17:02, James Hilliard wrote:
> On Fri, May 30, 2025 at 5:56 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On 5/30/25 16:46, James Hilliard wrote:
>>> On Tue, May 27, 2025 at 2:02 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>>>
>>>> On Tue, May 27, 2025 at 01:21:21PM -0600, James Hilliard wrote:
>>>>> On Tue, May 27, 2025 at 1:14 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>>>>>
>>>>>> On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
>>>>>>> Some devices like the Allwinner H616 need the ability to select a phy
>>>>>>> in cases where multiple PHY's may be present in a device tree due to
>>>>>>> needing the ability to support multiple SoC variants with runtime
>>>>>>> PHY selection.
>>>>>>
>>>>>> I'm not convinced about this yet. As far as i see, it is different
>>>>>> variants of the H616. They should have different compatibles, since
>>>>>> they are not actually compatible, and you should have different DT
>>>>>> descriptions. So you don't need runtime PHY selection.
>>>>>
>>>>> Different compatibles for what specifically? I mean the PHY compatibles
>>>>> are just the generic "ethernet-phy-ieee802.3-c22" compatibles.
>>>>
>>>> You at least have a different MTD devices, exporting different
>>>> clocks/PWM/Reset controllers. That should have different compatibles,
>>>> since they are not compatible. You then need phandles to these
>>>> different clocks/PWM/Reset controllers, and for one of the PHYs you
>>>> need a phandle to the I2C bus, so the PHY driver can do the
>>>> initialisation. So i think in the end you know what PHY you have on
>>>> the board, so there is no need to do runtime detection.
>>>
>>> Hmm, thinking about this again, maybe it makes sense to just
>>> do the runtime detection in the MFD driver entirely, as it turns
>>> out the AC300 initialization sequence is largely a subset of the
>>> AC200 initialization sequence(AC300 would just not need any
>>> i2c part of the initialization sequence). So if we use the same
>>> MFD driver which internally does autodetection then we can
>>> avoid the need for selecting separate PHY's entirely. This at
>>> least is largely how the vendor BSP driver works at the moment.
>>>
>>> Would this approach make sense?
>>
>> This has likely been discussed, but cannot you move the guts of patch #2
>> into u-boot or the boot loader being used and have it patch the PHY
>> Device Tree node's "reg" property accordingly before handing out the DTB
>> to the kernel?
> 
> No, that's not really the issue, the "reg" property can actually be
> the same for both the AC200 and AC300 phy's, both support using
> address 0, the AC200 additionally supports address 1. In my example
> they are different simply so that they don't conflict in the device tree.
> 
> The actual issue is that they have differing initialization sequences and
> won't appear in mdio bus scans until after the initialization is complete.
 > >> Another way to address what you want to do is to remove the "reg"
>> property from the Ethernet PHY node and just let of_mdiobus_register()
>> automatically scan, you have the advantage of having the addresses
>> consecutive so this won't dramatically increase the boot time... I do
>> that on the boards I suppose that have a removable mezzanine card that
>> includes a PHY address whose address is dictated by straps so we don't
>> want to guess, we let the kernel auto detect instead.
> 
> Yeah, I noticed this, but it doesn't really help since it's not the address
> that's incompatible but the reset sequence, I'm having trouble finding
> examples for mdio based reset drivers in the kernel however.

Fair enough, but it seems like we need to dig up a bit more here on that 
topic. There is an opportunity for a MDIO driver to implement a 
"pre-scan" reset by filling in a mdio_bus::reset callback and there you 
can do various things to ensure that your Ethernet PHY will be 
responsive. You can see an example under 
drivers/net/mdio/mdio-bcm-unimac.c to address a deficiency of certain 
Ethernet PHYs.

Through Device Tree you can use the standard properties "reset-gpios", 
"reset-assert-us", "reset-deassert-us" to implement a basic reset 
sequence on a per-PHY basis, there are other properties that apply to 
the MDIO bus/controller specifically that are also documented.

How does it currently work given that your example Device Tree uses:

compatible = "ethernet-phy-ieee802.3-c22"

this will still require the OF MDIO bus layer to read the 
PHYSID1/PHYSID2 registers in order to match your PHY device with its 
driver. You indicated that the PHYs "won't appear in mdio bus scan" 
unless that sequence is implemented. How would they currently respond 
given the example?

If you can involve the boot loader, you can create a compatible string 
for your PHY of the form:

compatible = "ethernet-phy-idae02.5090"

that includes the PHY OUI, and that will tell the OF MDIO bus code to 
bind the PHY device with the driver specified in the compatible string 
without reading the PHYSID1/PHYSID2 registers. Since you can detect the 
boards variants, you could do that.

It then becomes highly desirable to have a "dedicated" (as opposed to 
using the "Generic PHY") driver that within the .probe function can take 
care of putting the PHY in a working state.
-- 
Florian
