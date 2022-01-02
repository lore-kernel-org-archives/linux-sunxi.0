Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E5A2C80
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Jan 2022 17:38:55 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id i22so65789318wrb.13
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Jan 2022 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wWLcKGVB1L+M/AiUcBrGPhY5Q0k7V6b5eY3DoUOJMD8=;
        b=csZHGY26pjatP+CDAnS2WMlOd0K0PgW1V0FMFl7ejbepqwQz/MGKn+eRen/1UweBeu
         GGi0g8PdQ87eLfPzL1mDNUcGf3cF70JSGhz3D4AYURckPR/vcZ3y5hpw1fP40aIJgfTn
         Fne7LZ7shhqEYP3gT8cXawpvhAYyPbm5mBHWnTKcaEag+ms7hlf3U+q9D+b3NiF3paUS
         eRwVJxbpHMBEPdatzAl7z648n5OBTRNH16Ll703ovq0c/3RGCxYPje9jcq+QIMe1Olj+
         +FpO7R98DAJZnP+/fbvUbBUNQrivxylkP2iIcUBAk16cbT7oMhGBtvfiq1+SlNZg2Xnp
         yj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wWLcKGVB1L+M/AiUcBrGPhY5Q0k7V6b5eY3DoUOJMD8=;
        b=PHQfv508GP2L2CPSw5HmYNQcn59Y+jlDhEvufdYChobG7+C6gQL4Bd/ofzP2HZp6PI
         jxydzKyqL440+l5EZFDY6GpchmpgHmJHmITDOGHkhuMHtFASkrfALG7vAJPYC2jR4enj
         f6ch1+2lKctJRNZbYpzYhhYZYL9sSMBrO0oe+WlY6tMbDHokjk3LSHU+y1D6ni5r4MnM
         vC6og7qpmBTyAivZOEcDoMqv4Rbvt4n/kDmxjFHg/s2bQa9G0nk89qK9rRO4S0W8kMnh
         d4H2ytZngSY5alr/g0dKk5AOAZzwXZs7vAxYiY6PIP4M9LaOwqHWuYCzLo4b6k2w4J9Y
         x01g==
X-Gm-Message-State: AOAM530WmC2i+u1d7BgvySc++LQhz+aAJz8A6J3oGmrVAL9ut4c8Jdfb
	pv/i/gGzlEPka75tV9fZ+2w=
X-Google-Smtp-Source: ABdhPJx3omdWEPyY14zY26ZL/okoE6UgJ7jwIZfMCKhDBqivpngpgjI4u0TAz3uLzlOh77rjr6U7+A==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr24447262wrs.588.1641145134005;
        Sun, 02 Jan 2022 09:38:54 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id b16sm35872809wmq.41.2022.01.02.09.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 09:38:53 -0800 (PST)
Date: Sun, 2 Jan 2022 18:38:51 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Conley Lee <conleylee@foxmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, mripard@kernel.org, wens@csie.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	jernej.skrabec@gmail.com
Subject: Re: [PATCH v6] sun4i-emac.c: add dma support
Message-ID: <YdHjK+/SzaeI/V2Q@Red>
References: <20211228164817.1297c1c9@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <tencent_DE05ADA53D5B084D4605BE6CB11E49EF7408@qq.com>
 <Yc7e6V9/oioEpx8c@Red>
 <tencent_57960DDC83F43DA3E0A2F47DEBAD69A4A005@qq.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_57960DDC83F43DA3E0A2F47DEBAD69A4A005@qq.com>

Le Sat, Jan 01, 2022 at 03:09:01PM +0800, Conley Lee a écrit :
> On 12/31/21 at 11:43上午, Corentin Labbe wrote:
> > Date: Fri, 31 Dec 2021 11:43:53 +0100
> > From: Corentin Labbe <clabbe.montjoie@gmail.com>
> > To: conleylee@foxmail.com
> > Cc: davem@davemloft.net, kuba@kernel.org, mripard@kernel.org,
> >  wens@csie.org, netdev@vger.kernel.org,
> >  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v6] sun4i-emac.c: add dma support
> > 
> > Le Wed, Dec 29, 2021 at 09:43:51AM +0800, conleylee@foxmail.com a écrit :
> > > From: Conley Lee <conleylee@foxmail.com>
> > > 
> > > Thanks for your review. Here is the new version for this patch.
> > > 
> > > This patch adds support for the emac rx dma present on sun4i. The emac
> > > is able to move packets from rx fifo to RAM by using dma.
> > > 
> > > Change since v4.
> > >   - rename sbk field to skb
> > >   - rename alloc_emac_dma_req to emac_alloc_dma_req
> > >   - using kzalloc(..., GPF_ATOMIC) in interrupt context to avoid
> > >     sleeping
> > >   - retry by using emac_inblk_32bit when emac_dma_inblk_32bit fails
> > >   - fix some code style issues 
> > > 
> > > Change since v5.
> > >   - fix some code style issue
> > > 
> > 
> > Hello
> > 
> > I just tested this on a sun4i-a10-olinuxino-lime
> > 
> > I got:
> > [    2.922812] sun4i-emac 1c0b000.ethernet (unnamed net_device) (uninitialized): get io resource from device: 0x1c0b000, size = 4096
> > [    2.934512] sun4i-emac 1c0b000.ethernet (unnamed net_device) (uninitialized): failed to request dma channel. dma is disabled
> > [    2.945740] sun4i-emac 1c0b000.ethernet (unnamed net_device) (uninitialized): configure dma failed. disable dma.
> > [    2.957887] sun4i-emac 1c0b000.ethernet: eth0: at (ptrval), IRQ 19 MAC: 02:49:09:40:ab:3d
> > 
> > On which board did you test it and how ?
> > 
> > Regards
> 
> Sorry. I sent the email with text/html format. This email is an clean version.
> 
> In order to enable dma rx channel. `dmas` and `dma-names` properties
> should be added to emac section in dts:
> 
> emac: ethernet@1c0b000 {
> 	...
> 	dmas = <&dma SUN4I_DMA_DEDICATED 7>;
> 	dma-names = "rx";
> 	...
> }

Helo

Yes I figured that out. But you should have done a patch serie adding this.
Your patch is now applied but it is a useless change without the dtb change.
You should also probably update the driver binding (Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml) since you add new members to DT node.

Furthermore, why did you add RX only and not TX dma also ?

Probably it is too late since patch is applied but it is:
Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-on: sun4i-a10-olinuxino-lime

Regards
