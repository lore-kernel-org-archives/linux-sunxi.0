Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27F66001
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 17:56:18 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id j7so7499382wmp.2
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tp/mgAHgccbgU9bAMXiScmyIvCd30+VQEBf2GurCHPE=;
        b=NeORGT0pgGebZrwkVHkg52nMivvW56/r+8xwY4nE1j8QhfggCmqERHDAraqqq+NLFM
         n6YnGISqsnPnQANEOGT7V2+jFi9ulS90HZXHFBbS/5BtQNlXKPVEhgOtcjrbXa8u6pe6
         oxwLl2M82Dq+bEO5FQLaEHpIy7jgJqXQ/rlOXF1lSrgTqTqYnoRJITYuCBEau5LzWIQN
         3/ivFSZ5Q8gKsJ6HCsJaa/2yblKxLkkc6C5XhM7Tviz8k+/OG+xXZhd1KFgCMeZygEnr
         /wPJJQzQ+uSw9pUnOOvymkP4+dzQbAEUvVBHm1wl8dzTiF2g9Rvje+eASF609tmnGilD
         8NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tp/mgAHgccbgU9bAMXiScmyIvCd30+VQEBf2GurCHPE=;
        b=g8FGqAXLCWKpM5vAlkIIb00UMBvezBwIclmrFu2MaWQRM3DYjctcgkCCxdY9LKxViO
         sWOjkcvu4EjDECJ0bHM4Wf4sbUjceW3FqV88oKhvNogSKq6ibdHqlIfaHWe15xtUfcW9
         qsdM8jPVMK/IbZKLMDwg2T2F0/aziSoyBJHnPt/wG64EtIDTu7p6s6RBAfTkmZkV3iQk
         hEvDLDW4orx3w2Pi+iVxp/jHEU54aB+8qqO3vfGZB9fQ2hfdQLqGZkmGnlBjcfTw8++0
         RqqV3EnHwO50boTWMa1ADxG2X8Y5RUVYhUEi7D19h5Pqv7+59/ehEg/FEzrjPd2c87B3
         JdQA==
X-Gm-Message-State: AJIora9I6ZZHj5m2uwdHHJPhf01UdPmCCV+1U5JQcWOIgVmhQTvpjNxi
	DxcbmfD8BI4Q6Fk0RxaeGqplKw==
X-Google-Smtp-Source: AGRyM1uaAaJsZIYUzoR96B0uDURnDI9gE4pPU/7G92tNYU6lhXMVPWEr4PbPEUYqRzy2za9/VYhVcw==
X-Received: by 2002:a05:600c:600d:b0:3a1:9712:5d31 with SMTP id az13-20020a05600c600d00b003a197125d31mr18969023wmb.67.1657043777275;
        Tue, 05 Jul 2022 10:56:17 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id r12-20020a05600c35cc00b003a04e900552sm22921126wmq.1.2022.07.05.10.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:56:16 -0700 (PDT)
Date: Tue, 5 Jul 2022 19:56:11 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, herbert@gondor.apana.org.au,
	heiko@sntech.de, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <YsR7O4q4IRI14Wkc@Red>
References: <20220701132735.1594822-1-clabbe@baylibre.com>
 <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk>
 <YsP0eekTthD4jWGV@Red>
 <20220705164213.GA14484@lst.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220705164213.GA14484@lst.de>

Le Tue, Jul 05, 2022 at 06:42:13PM +0200, Christoph Hellwig a écrit :
> On Tue, Jul 05, 2022 at 10:21:13AM +0200, LABBE Corentin wrote:
> > 
> > I just copied what did drivers/crypto/xilinx/zynqmp-sha.c.
> > I tried to do flush_dcache_range() but it seems to not be implemented on riscV.
> 
> That driver is broken and should no have been merged in that form.
> 
> > And flush_dcache_page(virt_to_page(addr), len) produce a kernel panic.
> 
> And that's good so.  Drivers have no business doing their own cache
> flushing.  That is the job of the dma-mapping implementation, so I'd
> suggest to look for problems there.

I am sorry but this code is not in driver but in crypto API code.

It seems that I didnt explain well the problem.

The crypto API run a number of crypto operations against every driver that register crypto algos.
For each buffer given to the tested driver, crypto API setup a poison buffer contigous to this buffer.
The goal is to detect if driver do bad thing outside of buffer it got.

So the tested driver dont know existence of this poison buffer and so cannot not handle it.

My problem is that a dma_sync on the data buffer corrupt the poison buffer as collateral dommage.
Probably because the sync operate on a larger region than the requested dma_sync length.
So I try to flush poison data in the cryptoAPI.

Any hint on how to do it properly is welcome.
