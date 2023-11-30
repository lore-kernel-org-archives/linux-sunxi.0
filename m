Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD13628
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Nov 2023 01:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIBu3dMT"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6cde14ff73bso433693b3a.0
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Nov 2023 17:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701306824; x=1701911624; darn=lists.linux.dev;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRlvrK07ME/swY1WtbkSFR7EDZxwvHnw2DwPwO6LavQ=;
        b=RIBu3dMTLT374H0lGBjdd/C6Y1prX6/eGVPL/JYsAHRn61mbVfNgHeuK3xtMXbT+P1
         NupAVRdLaTy7hx/ev0hr22g+9W2SsFRlLNrwtteL3mlDGJOBltwffk9deozFRdACR5v3
         l5AF7/6uwe5ets8DyEsCiiWv31ZKSqvjnem5V0X0jo1ht+qQdjPxp5hawtOW+NxvfyoJ
         d1n4K2fw1lreq+RzSmlCwXXMrWZJ/SrtFRbETTVdN2jQ/CNHSAALsfFLWLaegJOn0yrL
         vkxsSGOJ1XsesqDbkT3ZKoVmJAAbAroefY1RHJWtWc+yE3tVPTF9w9axwd+Nq09O1QDf
         5rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701306824; x=1701911624;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GRlvrK07ME/swY1WtbkSFR7EDZxwvHnw2DwPwO6LavQ=;
        b=kW4jcgUe7tHqJt+y88i6GwchKIh6KbBSbbIBvTaSyTxm0JJdMADMZFlbtT9IIN8i9b
         0TzQv/aBb/MAA1LAyJbBNOlZkDpJEvvy1bZ12LNfN4r/8Z1Pzpr7h9SWCLzlCITRRdiY
         OB5QyOI4tLXhUtqEVqDXgTr4dQitjyMZX9SSyuPkcuocdPWqmHQupaCxLnRfitZmVYvu
         X8os/fMerQf9NGOAGG9HE7QJN7Bu4zSFMb45vZv1pkXOFLCCCA4ME29HYVq5gUpMuRIl
         SHfyPm/dJzAP4Nzl+Cte9z5tZhqctq2hXeoyLkGsUHQxcx5g+g9NaPsxVK2injClp0FM
         SRLA==
X-Gm-Message-State: AOJu0YzzWkVO7KplnNXISGUDNa4yoC4rF9DRqzZwKSXX39N1xWQtgW3y
	ssX0KayMhsgblvpGTCpOpJ4=
X-Google-Smtp-Source: AGHT+IHWXFPf3pnitxvRRVnIq53o2oX4t0dZ7xmS/i8c9uaIbLku3rIFWerU43/CaJw+lmtOSxH0EA==
X-Received: by 2002:a05:6a00:1252:b0:6cb:8abd:39b5 with SMTP id u18-20020a056a00125200b006cb8abd39b5mr30053248pfi.1.1701306823895;
        Wed, 29 Nov 2023 17:13:43 -0800 (PST)
Received: from [192.168.1.3] (d23-16-72-139.bchsia.telus.net. [23.16.72.139])
        by smtp.gmail.com with ESMTPSA id i5-20020aa787c5000000b006cb7e61cfa7sm25736pfo.36.2023.11.29.17.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 17:13:43 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------souDGRPkyc90BWFO9uidqPL5"
Message-ID: <d410fbe1-bf0f-4cb5-99cf-3353b952985b@gmail.com>
Date: Wed, 29 Nov 2023 17:13:42 -0800
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

This is a multi-part message in MIME format.
--------------souDGRPkyc90BWFO9uidqPL5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Is the attached patch file going in the right direction?

On 2023-11-29 3:57 p.m., Andre Przywara wrote:
> Hi Stephen,
> 
> On 28/11/2023 20:07, Stephen Graf wrote:
>> Below is the console log from trying to use mtd_debug write. It 
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
--------------souDGRPkyc90BWFO9uidqPL5
Content-Type: text/plain; charset=UTF-8; name="--- docboardallwinnersunxi.rst
 .txt"
Content-Disposition: attachment; filename="--- docboardallwinnersunxi.rst
 .txt"
Content-Transfer-Encoding: base64

LS0tIGRvYy9ib2FyZC9hbGx3aW5uZXIvc3VueGkucnN0ICAgICAgIDIwMjMtMTEtMjggMjE6
MzE6MDYuODQ0NjA3NDAzIC0wODAwDQorKysgZG9jL2JvYXJkL2FsbHdpbm5lci9zdW54aS5y
c3RfdXBkYXRlZCAgICAgICAyMDIzLTExLTI5IDE2OjQ4OjAzLjY4MjM1MjMyOCAtMDgwMA0K
QEAgLTI1MSw4ICsyNTEsNyBAQA0KDQogICAgICMgYXB0LWdldCBpbnN0YWxsIG10ZC11dGls
cw0KICAgICAjIG10ZGluZm8NCi0gICAgIyBtdGRfZGVidWcgZXJhc2UgL2Rldi9tdGRYIDAg
MHhmMDAwMA0KLSAgICAjIG10ZF9kZWJ1ZyB3cml0ZSAvZGV2L210ZFggMCAweGYwMDAwIHUt
Ym9vdC1zdW54aS13aXRoLXNwbC5iaW4NCisgICAgIyBmbGFzaGNwIC12IHUtYm9vdC1zdW54
aS13aXRoLXNwbC5iaW4gL2Rldi9tdGRYDQoNCiBgYC9kZXYvbXRkWGBgIG5lZWRzIHRvIGJl
IHJlcGxhY2VkIHdpdGggdGhlIHJlc3BlY3RpdmUgZGV2aWNlIG5hbWUsIGFzIGxpc3RlZA0K
IGluIHRoZSBvdXRwdXQgb2YgYGBtdGRpbmZvYGAuDQo=

--------------souDGRPkyc90BWFO9uidqPL5--
