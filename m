Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CE770
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Jun 2021 14:27:06 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id t40so14543807oiw.8
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Jun 2021 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cS1D61UWM7D7f9J7258UNtSJuuL2xJgwPnJmsK1CIKE=;
        b=Drq4euRexolAYmKsw5YnQsTY+Ac/Qk3DtXRFtHBS2i9AvbFlh2UncXnNxs//tB8OdG
         ZSeIEHyqDQdGg7U4fbjvSRz+XnA9w1bsdX2BIxzhiPbgWumFBjtoTxx99m1SNaHyVBTF
         OFW5ki9GHslxZBUTKuwX1FKmf5mElQfY29yNc59EwGAFK7Nx9nDJBBI19HrJrAe5+f3F
         /FK4zekhGvSs3dLferQ5veRiKFDjRQFeZ2Gr6JiJwjugnjWk7B8Nh+j0KEhwPCU7X/Rx
         t25ppOPClB8MCpzBH9fDz74VXG+JQp2XaGr2xbkPBYO41Wxd01wGnkF3YLXSRW1Mpv0V
         k4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cS1D61UWM7D7f9J7258UNtSJuuL2xJgwPnJmsK1CIKE=;
        b=MIuXj0AEoKUgSIZank+/cuO8aMEtDm8QZec8SPwxPsS7knHvYQl6K6FsDsv9/USwhm
         jRr1jZHVox7nVU1U/ZI0Sz+e6DZ8YKxmaShLZK1lhIu8CB8jgwJSpSCWwak76cFBaZ8E
         vNNvKENpeu1ZI4jNAmJTJTvzsDGEb9SuMZ+2wwB6W5JqOEMJJMiqTqAzm7EDbr+x3/F8
         bKVzs9jaJMn7WDqV4ArPjtlPC1bI2rK6q0dULOcz2aQmkzwHpzzb5DiR8GZKza4a+EqD
         ugLTVTByq5X8Shsa/Khk83sf8Ljw475I/Son/NCiu9w/uVuhfOyRuM3/busXQ0INS+R+
         L8Ww==
X-Gm-Message-State: AOAM531VZ99UGPBFjaoa3hdTPNbkql1Lhmxu4mMhJvY8FSQPVrfS/m4a
	xjtdfBsQ783ApELDm3bgxQacLQ==
X-Google-Smtp-Source: ABdhPJy3zOStR4414HcnVU/hu0fUTjtzRD0SvMKTxiAT0JtYMmXILVT3id2ffgfVSbs6vvST1aQoyA==
X-Received: by 2002:aca:b406:: with SMTP id d6mr10656391oif.71.1623680825976;
        Mon, 14 Jun 2021 07:27:05 -0700 (PDT)
Received: from [192.168.1.134] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id x187sm2981180oia.17.2021.06.14.07.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 07:27:05 -0700 (PDT)
Subject: Re: [PATCH v2 RESEND] ata: ahci_sunxi: Disable DIPM
To: Timo Sigurdsson <public_timo.s@silentcreek.de>, mripard@kernel.org,
 wens@csie.org, jernej.skrabec@siol.net, linux-ide@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: sergei.shtylyov@gmail.com, gregkh@linuxfoundation.org, oliver@schinagl.nl
References: <20210614072539.3307-1-public_timo.s@silentcreek.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <4c873409-db09-31ea-485e-daa0433c674b@kernel.dk>
Date: Mon, 14 Jun 2021 08:27:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210614072539.3307-1-public_timo.s@silentcreek.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/14/21 1:25 AM, Timo Sigurdsson wrote:
> DIPM is unsupported or broken on sunxi. Trying to enable the power
> management policy med_power_with_dipm on an Allwinner A20 SoC based board
> leads to immediate I/O errors and the attached SATA disk disappears from
> the /dev filesystem. A reset (power cycle) is required to make the SATA
> controller or disk work again. The A10 and A20 SoC data sheets and manuals
> don't mention DIPM at all [1], so it's fair to assume that it's simply not
> supported. But even if it was, it should be considered broken and best be
> disabled in the ahci_sunxi driver.

Applied, thanks.

-- 
Jens Axboe

