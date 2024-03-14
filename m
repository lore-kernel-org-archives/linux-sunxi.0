Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D1E20EB
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 00:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710375594; cv=none; b=ZhHt0hBdSoVIqtL6idI0tF3u7tIz4a5z1w80IcVDNBAdyhfI6T/TAtTq5GeQxxHQJkhh66oOrPgE0hxpBtl7qty8tiDzoCSaFvEOQXn2hEfP8IwpYc+oWw3nNlgCYNsRfxEuI8LJZxFk7FpVziGYrbgLBWbYtQDfIrQRlM4fXi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710375594; c=relaxed/simple;
	bh=cvjr7vOFozIDWWTn3qQ7zeEQs6nDG0RhTHwjCwCkPzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5d9oPbnkeGSLWanfrueLgtkQd2ow3eFvVnX3vg5Owv1bsp5IKIDQKyz7aMjN3dulKBp5O8xaOerbnFtaVJOS+CyUUvr+AtZiZVNVSH1QxS9NT4DZvLYI9y7/9kr+UyvGNst8MDwA3E/5Cv/t6ljTLmt2M+54qDk/D/VlwESS1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXO9G4B/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXO9G4B/"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56647babfe6so479512a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 17:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710375591; x=1710980391; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gi5lOB1225/Tw8XwtTr9JJ7GO1qiwL+V+pPIt5VxhD4=;
        b=ZXO9G4B/46MhUAdkLI+IjhDZdp/VmSX44B3vbobhRxG99ybsM2YkqsA0ryfr5nDkTx
         YyNkU2YdGpCbKM4ewPlTYHKvw2RKmzffAY2noXMNZP2WCDncgfKCzYeA7u9pqcoaoVJ1
         XSetFrGuLCM2TjPxffJGz/1tZ00sHzW1NSw9SVItT6Q7wG16rfH+EtQk3afBQFK6hYiR
         JkBv9Hbqk9Y6XzK1ZHp4VL3QLqeLo/vY9p++zcQTUAOj2T5wVAWK3nfVqfdK2eFstWYZ
         as1+UpbxU+/ZmwHoNH/9A0o36SLrhq5EqHAeLY6r7H/ikMNYwEgu9PPyItlcYY/uhBDv
         BmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710375591; x=1710980391;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gi5lOB1225/Tw8XwtTr9JJ7GO1qiwL+V+pPIt5VxhD4=;
        b=BgUMoVLAp7ipLbkRTqYvcRgwHCoKyTOPHVlNq+ijI+tmVTuVSXttpFYzUa3b+D61BB
         llMWsma50zndXFFk5ruhXMcmwgQQOcGUB9oG/LMYD/si2jZEm2f29Y6wUG4FwIPb+KQ2
         prmvkIGQkAJC8xAl0npyKeTgofY43/Up88rzg3b/b6tXlMNYKoW4OFQsIzfbcYuhq+Ck
         Vu1xg1L7iXF5/+wZFCh3KeOq+8kbVlHVAre96ZqRjiCXXpnZjrMGMtR7BqipeklgJx2Z
         N3fuOJUMg4PsHhTmmsCUGgamz3fZ9WohUvxRcFA22cayb9pAt0MATd3iwF5ix+c81pbZ
         XHkA==
X-Forwarded-Encrypted: i=1; AJvYcCUujcIx9rxK/nCq5tn78MJ/3x9F1dwS4WJE7rxMwlFKRRWMGzPhnaOeMCINhWwJaap/qKTX3vGn5c0SXuU7DN0Lm9/QGB9AtU+uH6Y=
X-Gm-Message-State: AOJu0YylwavOa7IGzveDOyMcyWtVQ8ky5cNr4+sjQyTX6yS2O8H+EZcW
	eEcahVlyRB13OCe43dQmDRw+5TidKDLO3l1vm57gv+NZFP/w1UyH
X-Google-Smtp-Source: AGHT+IH9gIPatjognOIgdNBajsMhnQyU8R1MRhyTyLHEQ917mh3z72oV1JSxSPO5SB/1s3+4yB+kVw==
X-Received: by 2002:a05:6402:1f12:b0:568:3362:ccdc with SMTP id b18-20020a0564021f1200b005683362ccdcmr67312edb.16.1710375590783;
        Wed, 13 Mar 2024 17:19:50 -0700 (PDT)
Received: from [192.168.100.117] (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id b70-20020a509f4c000000b00567c34d8a82sm141815edf.85.2024.03.13.17.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 17:19:50 -0700 (PDT)
Message-ID: <55eda2c6-1bca-463d-a908-1887543a47a5@gmail.com>
Date: Thu, 14 Mar 2024 01:19:28 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] dts: arm64: sunxi: add initial support for t95 tv box
Content-Language: pl
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: wens@csie.org, samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240311174750.6428-1-ressetkk@gmail.com>
 <13468418.uLZWGnKmhe@jernej-laptop>
 <20240313173808.38d893b5@donnerap.manchester.arm.com>
 <8344274.T7Z3S40VBb@jernej-laptop>
From: Kamil Kasperski <ressetkk@gmail.com>
In-Reply-To: <8344274.T7Z3S40VBb@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jernej, Andre!

Thanks for the reply. My board has a name "H616-T95MAX-AXP313A-v3.0".

I believe these boards are two different revisions and the one with 
AXP313A is a newer one, besides incorrectly label as v3.0. Sharing 
common configuration between boxes is also a good idea but for this 
specific configuration I would be cautious. From my experience with this 
board the default configuration for X96 Mate is not working at all. I 
suspect because of the PMIC and DRAM differences.

Memory installed in X96 Mate is DDR3L and in mine T95 it's DDR3, hynix 
H5TQ2G43BFR, that requires 1.5V to operate.

The rest of configuration for both boards, like HDMI, MMC, EPHY and 
audio codec seems to be the same across almost all H616-based boxes that 
I've researched.


Moreover please let me update the patches and send v2 that aligns with 
mainline branch. I've incorrectly assumed to use sunxi fork instead of 
master. Sorry!

W dniu 13.03.2024 o 19:00, Jernej Škrabec pisze:
> Dne sreda, 13. marec 2024 ob 18:38:08 CET je Andre Przywara napisal(a):
>> On Wed, 13 Mar 2024 18:25:14 +0100
>> Jernej Škrabec <jernej.skrabec@gmail.com> wrote:
>>
>>> Hi Kamil!
>>>
>>> Dne ponedeljek, 11. marec 2024 ob 18:47:47 CET je Kamil Kasperski napisal(a):
>>>> T95 is a most commonly known for being a box with a pre-installed malware.
>>>> It uses Allwinner H616 and comes with eMMC and DDR3 memory.
>>>> This device comes with two versions - one with AXP305 PMIC and another with AXP313 PMIC.
>>> I have this board and it always felt like a clone of X96 Mate, which is
>>> already supported in kernel, except for broken sd card detection. Would it
>>> make sense to unify those two boards and just overwrite or update parts here
>>> that are not the same?
>> I think the box you have is an older one, with the AXP305? IIUC, this is
>> about a newer revision with the AXP313. There are quite some differences
>> between the two PMICs, though it might still make sense to share the DTs,
>> see the OrangePi Zero[23].
> Right, mine is with AXP305. It has "T95MAX v4.0" printed on PCB.
>
> Kamil, does your board also have "MAX" mentioned somewhere?
>
> Best regards,
> Jernej
>
>> Cheers,
>> Andre
>>
>>>> Kamil Kasperski (3):
>>>>    dt-bindings: vendor-prefixes: sunxi: add T95 to vendor-prefixes
>>>>    dt-bindings: arm: sunxi: add t95 compatible string to list of known
>>>>      boards
>>>>    dts: arm64: sunxi: add initial support for T95 AXP313 tv box
>>>>
>>>>   .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>>>>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>>>>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>>>>   .../dts/allwinner/sun50i-h616-t95-axp313.dts  | 138 ++++++++++++++++++
>>>>   4 files changed, 146 insertions(+)
>>>>   create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-t95-axp313.dts
>>>>
>>>>    
>>>
>>>
>>>
>>>
>>
>
>
>
