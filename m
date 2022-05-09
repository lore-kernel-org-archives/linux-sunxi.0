Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65AF1865
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 11:16:44 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so8061507wmn.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jNOBE1z/4NtpGLe00EXXh4Iu7ejgcHgzbGnUckjMihw=;
        b=WvdzSshWmxodyKHlw6VFoeqRqJESG3fTgU+7I4UwSjiytpfn8XZqxJYSvw9CVd7fCf
         k6Kkw32dLAD4+IDNlIel9WEjVDjB8/qRninhCMqLZ4ZnIzv5Hw0gWmEfZTsGuWkv2HZf
         lWZh0P36OMaddpkd7Wj+ExVdMlgsEF59SrAhYtILImU8N0lKcECHW0noMqjcZWMwMIhp
         Vwy2EdGEgMxB3+AwgoNiyxalqy4iH3U+dx20/Pf0ui84FGgt/27RpNlHCLjToRJiPNlL
         BKyP0jBH50B/Lm4odz69ikfLK6Ojo+7uKc0BoeUzj9Anp5d7P6iETJpIF5RwTRO6i4wq
         QNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jNOBE1z/4NtpGLe00EXXh4Iu7ejgcHgzbGnUckjMihw=;
        b=fe6X7AhXpg2B4zF60aTxDatJOrFDDEXC47+mTLGnzI+FE3mTRwfz5j5F/p2CT1u1jl
         sB+k5pPtUGFf3LJuALQSU74iO+I6/nfxeXNdEMDvxj+uz58dUWbXe7ArwoF8exUb2bgX
         XAkuDERw+i03LFEx0Sx6Uk1LsMei51FqBka6a8rBlf/bIEweSj+6yqDZx+jYF+61lwsL
         JVsvRIsgJ5O4LJ21R/urEGlIwT8M9ndEBIWaELhCyzihLQsbgQoyskFLIDdQQpdt1SQU
         kQfQ0VYyVgNXWqlSXKQ5zTYraf6VCWEXXcA8au1d/66m4BjnvL9OgpHRfuuhK7fejKjK
         tsRA==
X-Gm-Message-State: AOAM531H4y2lKTdKjn48kbcYltszylDVgDo5icq9/998Jix/trlnmXO/
	uct8cC+RUXP9HVnAZ7YUSQPuvw==
X-Google-Smtp-Source: ABdhPJw/uA3KyEOb7IOfYdcJibXDQ2ibAG9h0d3kW5wk9pYdwo4Xg6EC+5Z1GD4ZWa2JBQRLRfPIJw==
X-Received: by 2002:a7b:c215:0:b0:394:5235:fe1 with SMTP id x21-20020a7bc215000000b0039452350fe1mr21703152wmi.56.1652095002759;
        Mon, 09 May 2022 04:16:42 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id x18-20020a5d4912000000b0020c5253d928sm10611514wrq.116.2022.05.09.04.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 04:16:42 -0700 (PDT)
Date: Mon, 9 May 2022 13:16:38 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: alexandre.torgue@foss.st.com, andrew@lunn.ch, broonie@kernel.org,
	calvin.johnson@oss.nxp.com, davem@davemloft.net,
	edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com,
	joabreu@synopsys.com, krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org, lgirdwood@gmail.com, linux@armlinux.org.uk,
	pabeni@redhat.com, peppe.cavallaro@st.com, robh+dt@kernel.org,
	samuel@sholland.org, wens@csie.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/6] ARM: dts: sunxi: move phy regulator in PHY node
Message-ID: <Ynj4FlyhZ3lEtLBT@Red>
References: <20220509074857.195302-1-clabbe@baylibre.com>
 <20220509074857.195302-5-clabbe@baylibre.com>
 <20220509115533.1493db30@donnerap.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509115533.1493db30@donnerap.cambridge.arm.com>

Le Mon, May 09, 2022 at 11:55:33AM +0100, Andre Przywara a écrit :
> On Mon,  9 May 2022 07:48:55 +0000
> Corentin Labbe <clabbe@baylibre.com> wrote:
> 
> Hi!
> 
> > Now that PHY core can handle regulators, move regulator handle in PHY
> > node.
> 
> Other than this is somewhat more "correct", is it really needed for those
> boards? Because it breaks compatibility with older kernels, so when we
> update the DTs in U-Boot, we run into problems (again).
> 
> IIUC this series is about the OPi3 & friends, which didn't work with older
> kernels anyway, so can we just skip this patch (and 5/6), to just enable
> the boards that didn't work before?
> 
> Cheers,
> Andre
> 

We could have a situation where stmmac handle phy for older boards, and PHY core handle them for new boards.
Up to maintainers to see if they want a split situation or not.
