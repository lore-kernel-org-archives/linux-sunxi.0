Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F09F7E
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 13:27:35 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id c11so19438607wrn.8
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 06:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QFVN/hz05R4qwSXg2D2znBc/cojLhJAL9Em25eSEyUs=;
        b=6xRVzIssKst/rqxxPREtWICDSxF4w5ikEyLXgYtiyHfwoFR62qzHqhy8MmdXwbFsiH
         EN1s7NRkVK630kW4S0DZ8IJ4ek3A4DIcX+O5sQVk13Q5lSzHcx+ZBJ6N+nE+qVOEutxO
         YhmV0NqHQZ6GKsIJ5dcqIY3iRnJ92q4763GClOxJYQgCR2IVAZSWhvlNBcYgqyEf2mdg
         sL+s9a0M0uDwEKlJN/ZRwI8qqGgM6Pnv9w9kBxO7UHjmLq2VG1/cwAQFjwhwWOk6DmS3
         WXcsuMHOTqvaPxA2qMLhJfzMUCLGkMXpGJWTgG01bCjZr8SOd9rBJH3+ZJfZg+FsqZvJ
         mKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QFVN/hz05R4qwSXg2D2znBc/cojLhJAL9Em25eSEyUs=;
        b=4rDiGsgCCDSKnQyzkZT7XIfh68xOqtZwsskisPchz6cZqF3aPrDArs6P2RjkOMJ87G
         Nk45I4lX/5AuTDziejfdZfpis0+h9guwo5D48bJ+OaiWKQFDMNpvsVkAZCRiv7CWW0kT
         p5/uCyuzRFZy20CbZN09SeeDUzG2jiJ75LYbnPJBWSVjgeM7T+Ug99NGYgBpmRfcPgFr
         5K1nW6sNS/zhBSupqh8AlG/kB5TNVETrtvrzSuGovPhFTtWPUxAnvPMrNTWbhv5CUGv4
         scCvzgYqpolbDNxxPtWwL+8KJfnTbJ9QIfbhnKjqqpUcihRzVmbQXrYR0M2/+c6z74Z9
         vC4g==
X-Gm-Message-State: AOAM533kb28+kWnHc1NI4qrmNXec3lxzIL8Fsxjl7czTjGveYP45VUZP
	0g7cdp6NmVXO6+2nEcTVOfftRA==
X-Google-Smtp-Source: ABdhPJy2ss8Dz2yhDwsiVDbK2gmSF+OzAXLxhmvGcDLqB4SyyXjhEvJqTERDh5KjiXjGgI2r7WmGYw==
X-Received: by 2002:a05:6000:1f03:b0:20c:4d9e:7400 with SMTP id bv3-20020a0560001f0300b0020c4d9e7400mr13919108wrb.257.1652102853452;
        Mon, 09 May 2022 06:27:33 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id n7-20020a05600c500700b003942a244ee1sm12434830wmr.38.2022.05.09.06.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 06:27:33 -0700 (PDT)
Date: Mon, 9 May 2022 15:27:30 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: alexandre.torgue@foss.st.com, broonie@kernel.org,
	calvin.johnson@oss.nxp.com, davem@davemloft.net,
	edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com,
	joabreu@synopsys.com, krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org, lgirdwood@gmail.com, linux@armlinux.org.uk,
	pabeni@redhat.com, peppe.cavallaro@st.com, robh+dt@kernel.org,
	samuel@sholland.org, wens@csie.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/6] arm64: add ethernet to orange pi 3
Message-ID: <YnkWwrKk4zjPnZLg@Red>
References: <20220509074857.195302-1-clabbe@baylibre.com>
 <YnkG9yV+Fbf7WtCh@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnkG9yV+Fbf7WtCh@lunn.ch>

Le Mon, May 09, 2022 at 02:20:07PM +0200, Andrew Lunn a écrit :
> On Mon, May 09, 2022 at 07:48:51AM +0000, Corentin Labbe wrote:
> > Hello
> > 
> > 2 sunxi board still does not have ethernet working, orangepi 1+ and
> > orangepi 3.
> > This is due to the fact thoses boards have a PHY which need 2 regulators.
> 
> Why PHY make/module is it which is causing problems?
> 

The problem was stmmac support only one regulator for PHY.
