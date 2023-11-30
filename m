Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB0180
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Nov 2023 00:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYTQqELq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cfcc9b3b5cso4214665ad.0
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Nov 2023 16:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701303635; x=1701908435; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bpJduYuROYEa7GlONa/imIaOhaPtws/KthA5P0/Y0do=;
        b=DYTQqELqUKJexFwrQxWkLxzNnMntFzSjkguSbuJc9Ohcy0OebMQ/RdZvzQ31q7LYme
         crlw++vXEpfYYSrsBoXVvIVAiV6pTVE11T4vpX/KRzE+dUMA2Tbl3OHjqBrIxofOZdjk
         qkY0AH9iXbc+tVtpmvTDM/li14KDajZFnTVlsJtwauUNv9KIP7GRA5VaDscPr8Nhs6ad
         naoJzzPsTrc9QxYKwGPVSajaQo6J5qZtNejb8Q2NE8DI7WPycdD5ZeZdeB0l87lcKTMA
         akZjeniDPFXp3M1Y2/ogz6+8N6rIT/hGjNtdCWTEMZK6x7xwOXfH9s3IYUVeancK4mXj
         WQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701303635; x=1701908435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpJduYuROYEa7GlONa/imIaOhaPtws/KthA5P0/Y0do=;
        b=tqzbB1pWrS2T6DmNbKVQJxlAsd/1eyVC2cvQu2YH1vPm2oVwCPik0DRrC2foJyf9wt
         otdVo6hSa4IGwn40LffBUHMIcLxCdT2lVvZQ8yCrmFJZB1cRlFpsvUgRlF194e38QoQg
         1WFsCiPZfSMjGJrvKvUIiRNFiSvSRJOAqbKK4gjqiSuEz9lA7Yfyavyoroq7lNQZC94t
         Z8L4eg8F/HbvS7cE77gIqBE8A+0ShPJa+pSpu4Yms4Jr8zefJN1gY5dFAobf6VGbt6NZ
         YyzQOyuVp+bLx57L5+dZUpWBLJUQw6FdxHns8d4zeX6G5X3cxunFGxULohs0cGv9dr98
         MhEg==
X-Gm-Message-State: AOJu0Yx/iU+U9aq9IfOkazgQZNX/Je2YekOxsOPao91CzqlRoZr3jNDY
	XVFvnR0dgcSf17S7fj3XqkE=
X-Google-Smtp-Source: AGHT+IGGyCcUq2xQjNrW9L1yMPDfpnoUlFv5iZtC9TBlRTPaxJJ1c97PEYFMHgxIaJTLAnInk68qeg==
X-Received: by 2002:a17:902:c3c6:b0:1d0:3090:9584 with SMTP id j6-20020a170902c3c600b001d030909584mr455213plj.41.1701303634914;
        Wed, 29 Nov 2023 16:20:34 -0800 (PST)
Received: from [192.168.1.3] (d23-16-72-139.bchsia.telus.net. [23.16.72.139])
        by smtp.gmail.com with ESMTPSA id i1-20020a170902c28100b001cf658f20ecsm12992036pld.96.2023.11.29.16.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 16:20:34 -0800 (PST)
Message-ID: <a2e62d55-8209-432e-b01f-253e05c11186@gmail.com>
Date: Wed, 29 Nov 2023 16:20:33 -0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mdt_debug write
Content-Language: en-CA
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mikhail Kalashnikov <iuncuim@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Vignesh R <vigneshr@ti.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20231114013106.31336-1-andre.przywara@arm.com>
 <20231114013106.31336-4-andre.przywara@arm.com>
 <0eab5c21-4fdc-478e-9071-f43c12e01fb3@gmail.com>
 <20231126002349.55404e43@slackpad.lan>
 <465a5608-89f7-4691-a2e0-ebec9b85d994@gmail.com>
 <20231126122342.3944cad5@slackpad.lan>
 <d8862c87-072d-4f74-bb37-08f34c610cc8@gmail.com>
 <dae3bee5-e1c7-4154-959c-e41dabb5d844@gmail.com>
 <20231128013746.23648d39@slackpad.lan>
 <5d7ea381-2a57-46f7-85c6-2bcad339d1db@gmail.com>
 <0d46cc83-8820-4bf2-95bd-a0c12b6f7aff@arm.com>
From: Stephen Graf <stephen.graf@gmail.com>
In-Reply-To: <0d46cc83-8820-4bf2-95bd-a0c12b6f7aff@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for the update Andre.

The flashcp worked.  I rebooted without an SD card and the new u-boot 
started properly.

Now as to making a patch file, I will give it a try.  Keep in mind that 
when I started my working career the concept of patching was to shuffle 
a deck of IBM 80 column punched cards.

Console output:

root@orangepizero3:~# flashcp -v 
/home/sysadmin/u-boot-sunxi-with-spl.bin_with_792_clk /dev/mtd0
Erasing blocks: 206/206 (100%)
Writing data: 822k/822k (100%)
Verifying data: 822k/822k (100%)
root@orangepizero3:~#




On 2023-11-29 3:57 p.m., Andre Przywara wrote:
> Hi Stephen,
> 
> On 28/11/2023 20:07, Stephen Graf wrote:
>> Below is the consol log from trying to use mtd_debug write. It 
>> returned immediately with a strange success message.
>>
>> root@orangepizero3:~# mtd_debug write /dev/mtd0 0 0xf0000 
>> /home/sysadmin/u-boot-sunxi-with-spl.bin
>> file_to_flash: fread, size 0xf0000, n 0xf0000
>> fread(): Success
> 
> interesting, I was under the impression that "mtd_debug write" would be 
> the way to write to flash. In hindsight, the "debug" in that name should 
> have probably put me off. Anyway, "cat" is probably not a good choice, 
> "dd" is better, but it looks like "flashcp" (also part of mtdutils) is 
> the go-to tool, since it does the required erasing automatically and 
> also reportedly does some error detection. Can you please test this?
> # flashcp u-boot-sunxi-with-spl.bin /dev/mtd0
> I would test this on my end ASAP as well.
> 
> Do you feel like sending a patch to the U-Boot documentation to get this 
> changed then?
> 
> Thanks,
> Andre
> 
