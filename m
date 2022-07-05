Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC872917
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 08:21:18 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id r81-20020a1c4454000000b003a0297a61ddso9241774wma.2
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wfqoXVK+YfH3izkn1ZIOXk7M9UJ/gOHJBL54VlMil1E=;
        b=xUkNuB6sThZg8/L+TCfTHvgqmve+3X2XTscpzPB8Tdd347qOEdLnpGh+mxdoEih7j+
         LWCL7OdboRbOwv0QIsWPxwLkyW60r6irie07Mr+8PkDgDPCIjcWUhcM+RlBKaOlzwpiL
         I9oZqLzvc1EQwqvJkJygFu1TJthBVJpGZQo0/Xe8hUr8QpCPFrsHLL6F/ySU1L6krew6
         KDXsXBtTB9BWPKMq81vsoGDHHMUFq1YO/k86zB55BlddKyc4GChaRZ8aTpAIERpcpLcE
         1WndJcUi28Js1hwgiup05QRq/MZn02FUl9eX0YYVgkR7sZW3++szGVyA8qXWoGF0PzuR
         st7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wfqoXVK+YfH3izkn1ZIOXk7M9UJ/gOHJBL54VlMil1E=;
        b=CgzdejdfAleuR2ik5HloV35T4l5afZ0DXr7NQDndnHWDCwZ/HfwvZ0EUf/1TNeXFt5
         XMRnUkDmmkFNHTBVKQ4hrtMNdLa3P93L/jjaoB/e3iqCoTMJH2+2XJqsXzPCH4CQrVv1
         nyzTZpJYc3yGaVe6BC6SS1CZFhxUH/PVIQCyz4In8D2L4oPOzMOsddbh+xg3c44G9yjv
         /45/+f2r4wUBe5GzDit3dAwSj/Shlbacn/7+YZ+dw4BZBkmNimZR+yhEYk5EHHMZLoq8
         x5+ZCFeLO8s5dSCD53bTxm07ei0XkDqizJmtNSjE7MC9/pb7D6v8eNW2N9r3GWyLo7vX
         29EQ==
X-Gm-Message-State: AJIora+rz0gvE1SmcXPQRcDp9tMU9vg0F5iAMozI+kYCzTe1P75xvhzz
	Faywf2vNHbB7E/D1Gj53gIiRCg==
X-Google-Smtp-Source: AGRyM1tr6rhGjC+OjSy5qUIGsdXXqW+hoadeDxw4So3EyQixfHxlPvRR/BsUHVmT5zqFTafMEYVfUw==
X-Received: by 2002:a05:600c:4ece:b0:3a1:7816:31a9 with SMTP id g14-20020a05600c4ece00b003a1781631a9mr30790692wmq.100.1657009277148;
        Tue, 05 Jul 2022 01:21:17 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id m123-20020a1ca381000000b003942a244f47sm19512608wme.32.2022.07.05.01.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 01:21:16 -0700 (PDT)
Date: Tue, 5 Jul 2022 10:21:13 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: herbert@gondor.apana.org.au, hch@lst.de, heiko@sntech.de,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <YsP0eekTthD4jWGV@Red>
References: <20220701132735.1594822-1-clabbe@baylibre.com>
 <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk>

Le Fri, Jul 01, 2022 at 02:35:41PM +0100, Ben Dooks a écrit :
> On 01/07/2022 14:27, Corentin Labbe wrote:
> > On my Allwinner D1 nezha, the sun8i-ce fail self-tests due to:
> > alg: skcipher: cbc-des3-sun8i-ce encryption overran dst buffer on test vector 0
> > 
> > In fact the buffer is not overran by device but by the dma_map_single() operation.
> > 
> > To prevent any corruption of the poisoned data, simply flush them before
> > giving the buffer to the tested driver.
> > 
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> > 
> > Hello
> > 
> > I put this patch as RFC, since this behavour happen only on non yet merged RISCV code.
> > (Mostly riscv: implement Zicbom-based CMO instructions + the t-head variant)
> > 
> > Regards
> > 
> >   crypto/testmgr.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> > index c59bd9e07978..187163e2e593 100644
> > --- a/crypto/testmgr.c
> > +++ b/crypto/testmgr.c
> > @@ -19,6 +19,7 @@
> >   #include <crypto/aead.h>
> >   #include <crypto/hash.h>
> >   #include <crypto/skcipher.h>
> > +#include <linux/cacheflush.h>
> >   #include <linux/err.h>
> >   #include <linux/fips.h>
> >   #include <linux/module.h>
> > @@ -205,6 +206,8 @@ static void testmgr_free_buf(char *buf[XBUFSIZE])
> >   static inline void testmgr_poison(void *addr, size_t len)
> >   {
> >   	memset(addr, TESTMGR_POISON_BYTE, len);
> > +	/* Be sure data is written to prevent corruption from some DMA sync */
> > +	flush_icache_range((unsigned long)addr, (unsigned long)addr + len);
> >   }
> >   
> >   /* Is the memory region still fully poisoned? */
> 
> why are you flushing the instruction cache and not the data-cache?
> 

I just copied what did drivers/crypto/xilinx/zynqmp-sha.c.
I tried to do flush_dcache_range() but it seems to not be implemented on riscV.
And flush_dcache_page(virt_to_page(addr), len) produce a kernel panic.

Any advice on how to go further ?
