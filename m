Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABEE134B5
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Dec 2023 10:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELJWLIqy"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c9f413d6b2so35388191fa.1
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Dec 2023 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702118678; x=1702723478; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fY7ynBKPCSeJfUZQZBziVZS8J/xhhHax9vME1HSQU9M=;
        b=ELJWLIqyAg/pyYH+pvi3xIk3A6TReR37a4Q1zgj5ggYkfMeIuvcGlSbfkQYclmQLMz
         Xdb8w+IOhGcQZ4auCY00LP5lQTk/syB1qjiNoYZyCr5CmmMdiJVVjYzVhUFsGCrqYqq9
         HGUHT9fGZ3875uj3tJtvVJ3deJtOP4ERU28e1dXlPrrB/ve1YdG7yMBr1ub/+UIoSp4i
         +K1sYU0/+aoYNaxPxG1mGP0KQzEFGJEvhR14wdnT7KaWvNQKcQd1Nxpzk/QokiFxqKDN
         RYeKudyJu9kfs1qng3Q5+4cv3qNiLMDGc4D/stuR/KB615bsHX6m78X/Er5NhCzlCpWI
         aK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702118678; x=1702723478;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fY7ynBKPCSeJfUZQZBziVZS8J/xhhHax9vME1HSQU9M=;
        b=sQ3xumWiKNlTbcxXslkfVNojKpNS8plb50E9hItfxBF+QHQ4m4kSJmrZfXF5GL/tup
         ASp1F8mnEvWNihVaIwUn9hbTJtdQ49373cOeNvpjVOwk5kSYtqXmM/CgcY82cs5OXGFl
         tJlZWf8FSOR50xMIYv+r5DCm95rgYjPTNdMD/36Is2v+O/63ys33sJfRCwejxQqsaQIG
         cretm8fRblxQ/5e+++WMbJ287dKZr4XeAncEyridsbrZBPW7WWcGkmkTnETOS322wTn7
         L1BegWQXCKEy7eGaaZQpiAXMLDN5a7WYPPM2SD8GTVaI5u2+n9yPWfpd6GerRXJFY/Q8
         i45g==
X-Gm-Message-State: AOJu0YxALQQJLLAAAAy/1kdlmZLafgrLaI1nzE+L4ejGFrbqqDPJ7YOW
	Rrb5ojaXocKRwn7iBc33Swg=
X-Google-Smtp-Source: AGHT+IHYZjIB1wJvL8lKDSCDZ8BXV1l4fGj/CoOHxnNQO3v4GvEl1z2p/Vj2wIM4TEyWr5g50Pq3Vg==
X-Received: by 2002:a2e:9856:0:b0:2ca:16d0:9e9a with SMTP id e22-20020a2e9856000000b002ca16d09e9amr325815ljj.92.1702118678297;
        Sat, 09 Dec 2023 02:44:38 -0800 (PST)
Received: from [192.168.100.36] ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id 20-20020a2eb954000000b002c9f62145f8sm519334ljs.82.2023.12.09.02.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 02:44:37 -0800 (PST)
Message-ID: <a14fb458-caf0-4a4a-b76b-c2503b0840d2@gmail.com>
Date: Sat, 9 Dec 2023 13:44:34 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: andre.przywara@arm.com
Cc: anarsoul@gmail.com, bob@electricworry.net, conor+dt@kernel.org,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-sunxi@lists.linux.dev, lukasz.luba@arm.com,
 martin.botka@somainline.org, rafael@kernel.org, robh+dt@kernel.org,
 rui.zhang@intel.com, samuel@sholland.org, tiny.windzz@gmail.com,
 wens@csie.org
References: <20231128005849.19044-6-andre.przywara@arm.com>
Subject: Re: [PATCH v3 5/6] thermal: sun8i: add support for H616 THS
 controller
Content-Language: en-US
From: Maksim Kiselev <bigunclemax@gmail.com>
In-Reply-To: <20231128005849.19044-6-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin, Andre.

May I inquire? Why do we need a separate sun50i_h616_ths_calibrate() 
function? Why can't we just extend an existing sun50i_h6_ths_calibrate()?

At my glance the calculations in both functions are the same. We just 
need to handle a special case for the 4th sensor.

Best regards,
Maksim

