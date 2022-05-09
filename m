Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1D1FA0
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 14:38:43 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id b19so19753009wrh.11
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 07:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PJxb32bRzXR/aRLBsR5ItCKULL5H2PbNvFFo631ZV10=;
        b=PvwMCQIuWgWkIhLrIhWXG1QTXvWF92KgQc1EI2AxsHyY2uMYrt1QArVf58cNX+rcAB
         cTk5RS+HwQB7V20jNfD2vYmF5aOssv2ddRyXUcVdVPp7edxRIwDC7WDQ2TM+DslRqfTN
         k19rt6a+fMjaYUGl8SARO3HYtvaK5xrKDGq5iT1RBPEoZMuNPlD66IGp7r6nkP//ZxUM
         pgSl26YFc0kmow6T7eJGC1qtamYmEt6pCNeaLCG+pUzQ/XmgZUD4Of1INA1D+A76mbvD
         bMK5Akoyl05V96zTPt4Oa8U9v+eoaFw0GJiXjgMU1oFCENqGfPxLuTz+Ops8hAbu4fb0
         Gmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PJxb32bRzXR/aRLBsR5ItCKULL5H2PbNvFFo631ZV10=;
        b=pP5glDyhQOd0kWJp0CiDDDP3aZ4YjpmVyTeD20GJWTByzozP9i8bYd3P/9BxLHWLdJ
         87N+d1r9n0wRAlzOPdA5KMqxWY9HbC0Nm/38pnOiW+pUNIxYctV1XnZuzT+yvAUGBHNN
         eZgGRQfnCwYkXcQIR6ZAWvQPpOeSJ4sCp4nRmtfUYpBoKv8GBy/bETziMxeQwWy9E96W
         soX8ZLSHuqDWhR44FX5yypOe9VkilYwxhX0nAWnQnVZPSRT5+jb9BuOAUsieZhe1sj3D
         juyTuHZ45b/AJr+XcIkZlM4mH4jHQLOv5geSqnbUg2TflVq05VV2aknk9GIOBeSDC89B
         ST7Q==
X-Gm-Message-State: AOAM53128K/d71ge04h2BOYL9VzCZktsH15Dg+qTu/SGYOYvUhflgkql
	2iXX+woc9jSRSL1i6NGAzY3SMw==
X-Google-Smtp-Source: ABdhPJyLXHiIrMy3/wzvE/usa9gu2UG+1aeyzJbtytc5hHu8886sMKLghPjKsQvBsUd/mh/2HgtqKQ==
X-Received: by 2002:a5d:6452:0:b0:20c:999d:be77 with SMTP id d18-20020a5d6452000000b0020c999dbe77mr13675304wrw.52.1652107122355;
        Mon, 09 May 2022 07:38:42 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id m7-20020adffa07000000b0020cb42671aasm6829808wrr.105.2022.05.09.07.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 07:38:41 -0700 (PDT)
Date: Mon, 9 May 2022 16:38:38 +0200
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
Subject: Re: [PATCH 2/6] net: stmmac: dwmac-sun8i: remove regulator
Message-ID: <YnknbtzsBQrIV0hx@Red>
References: <20220509074857.195302-1-clabbe@baylibre.com>
 <20220509074857.195302-3-clabbe@baylibre.com>
 <20220509150907.6cf9c4d1@donnerap.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509150907.6cf9c4d1@donnerap.cambridge.arm.com>

Le Mon, May 09, 2022 at 03:09:07PM +0100, Andre Przywara a écrit :
> On Mon,  9 May 2022 07:48:53 +0000
> Corentin Labbe <clabbe@baylibre.com> wrote:
> 
> Hi,
> 
> > Now regulator is handled by phy core, there is no need to handle it in
> > stmmac driver.
> 
> I don't think you can do that, since we definitely need to maintain
> compatibility with *older* DTs.
> Is there a real need for this patch, or is it just a cleanup?
> I mean we should be able to keep both approaches in, and the respective
> board and DT version selects which it is using.
> 
> Cheers,
> Andre
> 

It is just a cleanup. But yes, probably keeping it will be necessary for easy compatibility.
