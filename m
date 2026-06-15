Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8EC2E7393
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Jun 2026 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545596; cv=none; b=F4V/6aJLXpENd2sBuYSQ9OdMTlGc5IoSSjB+2GRWz4fPIrn/CtztWqKqoyQz5BwkAc5mou9syViOk2WBlJVyNySeewME2HuxedeGssZvtYshSi7c7vRHle17w+0WmQbk8GwWx0VCwAruj7aGGPdpqY6ZOApZZGvxcYwQ5jGtfIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545596; c=relaxed/simple;
	bh=6Kch48sojf7uiTigvd+1WdQSRnstLfhc2vvsNDPRh8g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jUPAIjw699uRGrF/INW6PDQEbOaauCu6hUBMMPG26S9gjYrwu9zqSeJWf7HWLojbpH+k0yYcg7FmIoxc6pNFEy2Y4lbuoSJhmyNXligfqU6i1SNzQCUpMfR34qUBvR3Iu/In4gersM5mwWRXC3cEx5p6JdZ14CIe6VAVsesfJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SeAzANBj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SeAzANBj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2719612f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Jun 2026 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781545591; x=1782150391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksRwsZduIIB6SyG2nFNgDOhkTcDdI1Vxdkt4BX+vx3c=;
        b=SeAzANBjDSAbFc5kzhJp9ETBlUUwLEi/I0Ont9uMiCXZwFcq/zwhAnnassPOLEwl6C
         lhN7jS8bF+HQkNY4vYV5zXjLN4Q0/kYRctbELP77+JP4KGr0nbyXuL7HF72ktyoZzFGs
         de9/yGqCvq4gCK4giEHyIEbl/eGubCP0PY3kHSo3ijKQUFFVSuRbMyLcR2yrgdkpIH3Q
         KV0R4XXRjpZoXiM1e2CVJ4PEsg5la/1iP6orpsBGi+njS38Zltr2riKXnkjeCoE4Uc1R
         5KvodTKA8sYXXWcBzcUddDCUV4oIjPtRVnJuyyusxVb87ajBJma3O9p24+1Hptygz3cO
         oIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545591; x=1782150391;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksRwsZduIIB6SyG2nFNgDOhkTcDdI1Vxdkt4BX+vx3c=;
        b=fgZ2GYK440sFUekS1jmxTtS+DN0hAMUq8uiZP0Q+sYSXtn9KOWZW6KrQZb/sBcQHXf
         OI8eR4vV7jSRemvHE+RnzQds0JCI2ragw7vToO4FuSySXq749n5Vk/Zwxl1K8spdsrcq
         WzzbdRxNHr6kNzw/rezYK+VRAKicfSuS675kTPojtSG91TXjcGWYGs1O/yTedh9cE9+J
         h4ZjjinO66cQaadJxicEjeQfwScQ7gRa4d/M7ZJVBScL3PKmGV3rmu2taJPu1VmvS1SI
         VJ3zpouFaag9YkbaDgHmup355TPHQcvE8LMgMh1jQl25qryubqbhhDgdAo+1JLd5Q5Tn
         uMQw==
X-Forwarded-Encrypted: i=1; AFNElJ9asrE/+3AB7Bz49hOjnSubPC5kXo+WuF0tCzydy9Iz2ZLaibAt1YmoKJ9wwXfVKthdm/Imfho8JYBaGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAPNjLRIxqafJZNdZTRhlWr+lVTVPh7rc7atcBVB9xSzIO8xXt
	S5Y68fiuLEV4AxvU6Rx7q55BKQNGSSMhusa3dSPWwIe3ZBDCZ4y742jtg1b8n+OWPuQ=
X-Gm-Gg: Acq92OGuCG5XC6DTsjzmLMZwqnmIAQtAwmX6Fkk//Du7U3LSpNMqRowXdZFl4TnmUpJ
	wixXn1/P4MdmQPvd1JH1gpZBWqhs86rAPzSh+efdeklcrbkUBhOJT1MxqiZWE/PRGMy3O65koLL
	7xGXXinQZ7fLdlMRzOY6/fzcG8XD0mj+nLtMU3v53ysD+j2ftuYgqbbNdEqYooeOK26diwgFFlj
	9aPc+QPNCevlWC+HZc5BfbYDBqcpgEZvXXmiYDzCTOltry9xXtk819ot+jsRHn1R0K1sK6Dc0vI
	jLKpQdW01MUH/at/cKpXsWidS9UBzPylQaqkmeq0PoRb1uehnc8M5/AKryx17xpOf5iRrSppgYf
	iAEOruY2FrMXX3gkp2d4SNza3wVrbdeT/TXxjIRhWJyPz628yQw2TW3uQvYFEXTrzI9b8oSVEqW
	yuvwOO7waYqh7aFZgR6bTshw==
X-Received: by 2002:a05:600c:638f:b0:490:9df1:f0cf with SMTP id 5b1f17b1804b1-4922ff8eeaemr3741655e9.2.1781545591514;
        Mon, 15 Jun 2026 10:46:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5176:ebe3:853b:8fb0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4922fa3a8e4sm12251795e9.3.2026.06.15.10.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:46:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-rtc@vger.kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
In-Reply-To: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 28 Mar 2026 20:37:26 +0800")
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
	<20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
	<CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Jun 2026 19:46:29 +0200
Message-ID: <1j1pe7elxm.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On sam. 28 mars 2026 at 20:37, Chen-Yu Tsai <wens@kernel.org> wrote:

> On Wed, Jan 21, 2026 at 7:03=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> The RTC module in the Allwinner A733 SoC is functionally compatible with
>> the sun6i RTC, but its internal Clock Control Unit (CCU) has significant
>> changes.
>>
>> The A733 supports selecting the oscillator between three frequencies:
>> 19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
>> which frequency is actually used on the board. By defining all three
>> frequencies as fixed-clocks in the device tree, the driver can identify
>> the hardware-detected frequency and expose it to the rest of the system.
>
> No. The board device tree shall have the exact and correct frequency
> defined in the external crystal device node. The operating system can
> use the hardware-detected frequency to "fix" the in-system representation
> if it is off.
>
>> Additionally, the A733 RTC CCU provides several new DCXO gate clocks for
>> specific modules, including SerDes, HDMI, and UFS.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 +++++++++++++++=
+++++--
>>  include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
>>  2 files changed, 52 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-r=
tc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> index 9df5cdb6f63f..b18431955783 100644
>> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> @@ -26,6 +26,7 @@ properties:
>>            - allwinner,sun50i-h6-rtc
>>            - allwinner,sun50i-h616-rtc
>>            - allwinner,sun50i-r329-rtc
>> +          - allwinner,sun60i-a733-rtc
>>        - items:
>>            - const: allwinner,sun50i-a64-rtc
>>            - const: allwinner,sun8i-h3-rtc
>> @@ -46,11 +47,11 @@ properties:
>>
>>    clocks:
>>      minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>
>>    clock-names:
>>      minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>
>>    clock-output-names:
>>      minItems: 1
>> @@ -156,6 +157,38 @@ allOf:
>>          - clocks
>>          - clock-names
>>
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: allwinner,sun60i-a733-rtc
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +          items:
>> +            - description: Bus clock for register access
>
>> +            - description: 19.2 MHz oscillator
>> +            - description: 24 MHz oscillator
>> +            - description: 26 MHz oscillator
>
> No. There is only one input. As in there is only one set of pins for the
> DCXO. The inputs are the same as on R329 / A523. Just use that list.
>
>> +            - description: AHB parent for internal SPI clock
>> +            - description: External 32768 Hz oscillator
>> +
>> +        clock-names:
>> +          minItems: 5
>> +          items:
>> +            - const: bus
>> +            - const: osc19M
>> +            - const: osc24M
>> +            - const: osc26M
>> +            - const: ahb
>> +            - const: ext-osc32k
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +
>>    - if:
>>        properties:
>>          compatible:
>> @@ -164,6 +197,7 @@ allOf:
>>                - allwinner,sun8i-r40-rtc
>>                - allwinner,sun50i-h616-rtc
>>                - allwinner,sun50i-r329-rtc
>> +              - allwinner,sun60i-a733-rtc
>>
>>      then:
>>        properties:
>> diff --git a/include/dt-bindings/clock/sun60i-a733-rtc.h b/include/dt-bi=
ndings/clock/sun60i-a733-rtc.h
>> new file mode 100644
>> index 000000000000..8a2b5facad73
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/sun60i-a733-rtc.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
>> +
>> +#ifndef _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
>> +#define _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
>> +
>> +#define CLK_IOSC               0
>> +#define CLK_OSC32K             1
>> +#define CLK_HOSC               2
>
> The DCXO enable control has been present since at least the H6. We just
> never added it, as we would never disable it anyway.
>
> If you compare the RTC clock trees of the A733 and A523, the only addition
> besides the new gates seems to be the LOSC auto selection. But even that
> is just an illusion, as the A523 has the same registers for that.
>
> One could say the A733 RTC is almost backward compatible to the A523, if
> not for the two fastboot registers the A523 has at 0x120 and 0x124.
>
> So I ask that you try to integrate the differences into the existing
> driver and bindings. You can tweak and export internal clks if you
> need.

I'd like to help with that. I think it is doable but I have a question
regarding the binding of the existing driver, more precisely their usage
here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/clk/sunxi-ng/ccu-sun6i-rtc.c?h=3Dv7.1#n370

Clock indexes are supposed to be stable in DT (AFAIK) but with the code
linked the external 32k is at:

* "ext-32k" - so index 3 - if "clock-names" is present
* index 0 if clock names is not present

... but index 0 is supposed to be the bus clock according the binding
doc, whether "clock-names" is there or not :/

So what are those old r329 bindings ? is there a documentation defining
them somewhere ?

Cleaning that part would help with A733 addition in the existing driver
I think

>
>> +#define CLK_RTC_32K            3
>
> AFAICT besides being an internal clock, this is also fed to GPIO for
> debounce? We probably need to expose this on the A523 as well.
>
>
> Thanks
> ChenYu
>
>
>> +#define CLK_OSC32K_FANOUT      4
>> +#define CLK_HOSC_SERDES1       5
>> +#define CLK_HOSC_SERDES0       6
>> +#define CLK_HOSC_HDMI          7
>> +#define CLK_HOSC_UFS           8
>> +
>> +#endif /* _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_ */
>>
>> --
>> 2.52.0
>>
>>

--=20
Jerome
