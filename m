Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31C92C9C
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 18:13:31 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id j12so11913435qtr.2
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 10:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wUgl1Nx6ur30CB8RGVTiHTC9v38C5q5fllfbmJRA1nw=;
        b=hEvuc0iUzfqNhOgQLSg27zkIYxcr3kRWjOy6zDJyofQjPNRn9xIm5dA43jKeQgwB91
         ZYNM1jgR80MHD2CThfE2SYgBSF2SnqNtLBjCUwwgJ8lgLjwVqqWj62TxaeBBpP5ovtCc
         4d2kR+rMPHOhwY+ER6NFo09B9N0iHp9Wpwhj4sm8Ls0IjiYxkiAx6lzxF8RteqyJQLve
         YPD63Z+Y7AaPaL/AhA+JG2ykT4gYDB7bjlHuJwB8UHWhe1wEvwKx/cEalGWvgVwTkwwx
         Eyraw8c6YRvvGB6gIDe0e4axFm661r10VYgZeZkOHi/YfGEhOVwcGwxFtdcKotvKREK9
         8ylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wUgl1Nx6ur30CB8RGVTiHTC9v38C5q5fllfbmJRA1nw=;
        b=iNHG4Zs1prlKhMBvYOTDl4E9ES6HCOkbJM6uy8iSrRSnS6gZQGte0Ha7THw4dzGVrf
         qwP9Wues3HvELlZCBAaCG2JQl7khzdJUdnZFkkuFV++nTzcOplwmJc0plm6PV0F3ZTvS
         TIAqvfgowEcGkzKqsMsgURdMyvWwGjkIbCUygdpopr/JopSE16Z+S+F6bGiq6o9KSWjp
         fwF7P9uW5+uAevMGcuTh3Vf5MlXbWUtAQyWPRZlZSJHDv2fuQi3z24sJzdANyaXdlc0w
         g4e3oSfQRclwn8bRUwKpucH/DSaL9mtl1fLEQNqWb3HTnPlLgDM56gLxWY+li2JZkaUN
         nDMQ==
X-Gm-Message-State: AOAM531cNr5hWENOoX9VQ5aj8HHDlEJnbLX2+k8nQRrEv+8FCLDq/jA7
	oV+NCJzUyWHixKzRWWl0/D4=
X-Google-Smtp-Source: ABdhPJxES8Pf2Y+00LGGZ5MBPGxdmDs1cnFmjGpUTcTeUg4moYmDfQeFwcRwB0+DxzR03v0XYS382w==
X-Received: by 2002:a05:622a:38a:: with SMTP id j10mr16124398qtx.325.1643652810592;
        Mon, 31 Jan 2022 10:13:30 -0800 (PST)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id 41sm8176023qtb.82.2022.01.31.10.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 10:13:30 -0800 (PST)
Message-ID: <38e0aba2-78e4-d3fd-1c03-d0382eefde77@gmail.com>
Date: Mon, 31 Jan 2022 13:13:29 -0500
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Please test U-Boot Allwinner F1C100s support
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Andre Przywara <andre.przywara@foss.arm.com>
Cc: Samuel Holland <samuel@sholland.org>,
 George Hilliard <thirtythreeforty@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
References: <20220131125746.4702fac0@donnerap.cambridge.arm.com>
 <813A2F53-7592-4DDF-86B6-993BFB1A6819@benettiengineering.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <813A2F53-7592-4DDF-86B6-993BFB1A6819@benettiengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/31/22 08:07, Giulio Benetti wrote:
> Hi Andre,
> 
>> Il giorno 31 gen 2022, alle ore 13:57, Andre Przywara <andre.przywara@foss.arm.com> ha scritto:
>>
>> ﻿On Mon, 31 Jan 2022 13:17:52 +0100
>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>
>>> Hi All,
>>>
>>> I've tried several times on both F1C100s and F1C200s, maybe I'm doing
>>> something wrong but it doesn't work :-/
>>>
>>> I burn sd-card with:
>>> # sudo dd if=u-boot-sunxi-with-spl.bin of=/dev/sdb bs=1k seek=8
>>>
>>> I've triple-checked that the file has been written there by dumping the
>>> sd-card and I see it's written at 0x2000, so 8K offset, like the mangoPI
>>> image for example. But no uart output.
>>
>> I haven't looked in detail what would be needed for the SPL part of the
>> MMC driver to really work, I just checked that the base addresses are
>> correct, the pinmux looked alright as well.
>> The DT nodes are not needed for the SPL, and I don't see other changes
>> related to MMC in the original series?
> 
> Yes that’s true.
> 
>> Do you see UART output from the SPL, or nothing at all?
> 
> Unfortunately nothing either with SPL
> 
>> And you are not using UART0 on the PortF pins, so multiplexed with the
>> MMC, I guess?
> 
> I use PE0 and PE1 Uart0 according to dts.
> 
> Have you got such board to test it?
> Or we can wait for Jesse or George.
> 
> I’ve used the git you’ve pointed.
> 
> Anyway I think we’re very close to have it working.
> 
> At least my work “behind the scenes” will be worth, right Jesse :-)?
Yes, I'm sorry there wasn't much mention of you on this patch.
I Just woke up, sorry i couldn't be here earlier, I'll take a look with 
Giulio.
> 
> Best regards
> —-
> Giulio Benetti
> Benetti Engineering sas
> 
>>
>> Cheers,
>> Andre
>>
>>
>>
>>>
>>> Am I doing something wrong?
>>>
>>> Best regards
>>
> 
