Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F682CA4
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 02:12:34 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id r14so10348667qtt.5
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 18:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oWLaWBqKU9bDFEI7jGwjFV9Oc6o6kN6a87M4jeJhOxw=;
        b=JH9oLHMHm93TCWMIP4fie4uh+G1lO3v+0v+3TYuhfknvns213SeIYpjdoWNfo3bxGH
         STV8nmvOcHl7jk2Qee+RdbNAndTOHAOrBNF39z5cTSE/k59nSJx9RJQnjQfnO0zW6EFr
         oq+m4vGLK6NQVQcC6/w9EfYQqPiPnYehAYEzdUroa13X6aBU1JdKNqxjDLdD1YAeuKHb
         +8LQmGhR1nk3fQ7HlM1nP5HmQIvZqiFm7h8jBGT6DHzZQbqAbPO6a/ZQT6m9/d9UJLfp
         11ftWCetmMq+NY+YGCVkNsN4FdrmKNJPIn6V+SmxqiUdKzad+tPxG7jw+Y4I/vPMTkqU
         UbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oWLaWBqKU9bDFEI7jGwjFV9Oc6o6kN6a87M4jeJhOxw=;
        b=WsQHGVQJrDJc2I47zhKyScwqs507pSZAWIdnvzgYf4wrqv9NyJXsMmOTKGED6oct3Y
         tZQw8FIGJr1dCcxWq1BElsieEUE5TnysZnTN41vVWWG//AXAz/LoiSnBaD4OPOEhG54R
         1gXwxwUdykUjvzVE+U1jfwg3rruRguBAEs/1bt2ZLXDiynuMNmr0hsyaMu7KX5fb3Msm
         qvKxJ8VjI+Mm4RSFk+YgIVhMWnRO2dISTcNYEgBywISNgbCZcaaL7RwYVfn8qVLX4jVg
         Li/Pk2VvF+pF9mvpD9i1bGD0kJjdoFkNngBpx266QsYxbIfU1HJBmf1slcCxo/6HUFL+
         lUmQ==
X-Gm-Message-State: AOAM531VcCt/o7mKpVZmPPcRRwAZ4TxxmfCT5LqgNd/h3OKciQ9Hc1nF
	gaYTS+TAslnajb+u4ZmCB48=
X-Google-Smtp-Source: ABdhPJznKffd+HN16htrFyNhstC5Qrq0dvTjICntTtkZ2Jeq1h2aC9sn1a8L1JacBVoqFrtcjqw5QA==
X-Received: by 2002:a05:622a:1a84:: with SMTP id s4mr13136152qtc.593.1643595153122;
        Sun, 30 Jan 2022 18:12:33 -0800 (PST)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id o22sm7197857qkl.88.2022.01.30.18.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jan 2022 18:12:32 -0800 (PST)
Message-ID: <2ba1e2bb-e65d-8b79-dad9-1698b2dc6d12@gmail.com>
Date: Sun, 30 Jan 2022 21:12:31 -0500
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
To: Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
References: <20220131020427.2e57f75d@slackpad.fritz.box>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20220131020427.2e57f75d@slackpad.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/30/22 21:04, Andre Przywara wrote:
> Hi,
> 
> thanks to the tireless work of Jesse, I think the basic Allwinner
> F1C100s support for mainline U-Boot is now ready to be merged. Since I
> don't have the hardware, can any of you who have boards please give it a
> try on their hardware? I would really love to see some confirmations
> before I merge it.

I really have to thank you for reviewing!

> I put a branch here:
> https://source.denx.de/u-boot/custodians/u-boot-sunxi/-/tree/f1c100s
> 
> This should probably work on any F1C100s board, using the LicheePi Nano
> defconfig. Also curious about the F1C200s (looking at you, George ;-)

I have tested on both. Giulio has them aswell now.

> 
> This is very basic support at this point, there is no USB or SPI
> support, and even the SD card is not usable from U-Boot proper.

Sd card will work if we add it to the dts.

> I am hopeful we can add MMC and SPI support still in this cycle, but I don't
> want to hold back this series any longer, and it should be relatively
> simple support patches.

I have patches for both spi-boot and U-Boot proper spi suport.
I did manage to get it to find the boot device with:
`u32 brom_call = *(u32*)(fel_stash.sp-4);` in mach-sunxi/board.c with 
the suggestion that Stephen said. Should I submit after it gets into 
master or is tomorrow fine.

Many thanks,
	Jesse Taube
> 
> What should work though is booting via FEL and from SD card (the SPL
> MMC code is in place, if I am not mistaken). Just booting it to a U-Boot
> prompt via both methods would be a great test already. Maybe you can
> even upload a kernel and initrd via FEL and boot it from there, using
> $fdtcontroladdr for the DT address, for instance.
> 
> Any replies would be highly appreciated!
> 
> Many thanks,
> Andre
