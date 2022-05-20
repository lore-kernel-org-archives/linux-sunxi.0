Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35C27E
	for <linux-sunxi@lists.linux.dev>; Fri, 20 May 2022 08:16:04 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id s28so10290810wrb.7
        for <linux-sunxi@lists.linux.dev>; Fri, 20 May 2022 01:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sgVdkj+m0vdYfC42vgmnXcgErywSFim9EldJP/IRKb8=;
        b=UbCjQtGRYjLqlisKKVYQpJgMYj/br9KZw6pGqNIRnL84QxknHPwih4CK9F5I2S/7Ki
         IiOelDJRDtgCgP298udFAK1aWzVaCZ7RT4ZahHcBGmee5L74RImyWtVZcWbHwwmS31Vb
         KRCORvITE+zT6KppLMaGOMhi7pFikUYxpIb3NGlyYZ0qLcnYIJ2GAP6R1lpgYwgMX/LB
         7IHc+a+uWC+czjVbCL9a0shS9FDqRkGALziE0pfwdtD6S7qevDZOKUIRXJ9/Z+5O3bhU
         bak0XChjaPwOdMDWTkYPt7rKc16wH1TAgCSMNsAijtXjymRrf4RfcKq5SOzqu8iL3ZW/
         z1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sgVdkj+m0vdYfC42vgmnXcgErywSFim9EldJP/IRKb8=;
        b=hMpiGsPXWw/cFBsXN8cBXNSgbSzG4db5CccQCbgxGagbzBC22R5UqkGOCdJql1JVp2
         /gBJUiOb1neFgfUkqTC0KCxszqTNET8dhqTwgNkoQVdXBtVa6wBNBMRZGwBAvkX+BuLh
         d0wjAyM0pHaYkQGb/UFv2S1kfy4iVkuvTQKqsjTeuMQHskE++MLQVny8AQIwDWVHx4CG
         jyZ72dHtBbef2IWmwvivDtnsToH2XWrhmb0pLCepkjnDv3vWO/3S7NYiDqqPrfxz7BJo
         ZufMBJRf/u/rKeRZYTexLBScI5f7ipryAocM3FvXk0Zo9sketS9NqX1WsdoE+zlxKJNO
         EhVA==
X-Gm-Message-State: AOAM533ATXDSZeKS4/gt2tp+gl62ci/AcFSsfj0SEWq5LdnXiKcSkfjz
	+7vtMe2tH3k0+ClAgc7nIsJoTQ==
X-Google-Smtp-Source: ABdhPJyJit3hnS/YjTniZmJ2kknMK6SoFyfAJ/HlzlsgZ7pfH0IL0m/0hSt8/6YePAJ85te1SjUyuQ==
X-Received: by 2002:a5d:598b:0:b0:20e:6288:8c6a with SMTP id n11-20020a5d598b000000b0020e62888c6amr7114554wri.531.1653034563061;
        Fri, 20 May 2022 01:16:03 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id l6-20020a05600c088600b00397335cf750sm1283305wmp.47.2022.05.20.01.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 01:16:02 -0700 (PDT)
Date: Fri, 20 May 2022 10:15:55 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	calvin.johnson@oss.nxp.com, davem@davemloft.net,
	edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
	lgirdwood@gmail.com, linux@armlinux.org.uk, pabeni@redhat.com,
	robh+dt@kernel.org, samuel@sholland.org, wens@csie.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: net: Add documentation for optional
 regulators
Message-ID: <YodOO6PfsjelCa1x@Red>
References: <20220518200939.689308-1-clabbe@baylibre.com>
 <20220518200939.689308-5-clabbe@baylibre.com>
 <95f3f0a4-17e6-ec5f-6f2f-23a5a4993a44@linaro.org>
 <YoYqmAB3P7fNOSVG@sirena.org.uk>
 <c74b0524-60c6-c3af-e35f-13521ba2b02e@linaro.org>
 <YoYw2lKbgCiDXP0A@lunn.ch>
 <YoZm9eabWy/FNKu1@sirena.org.uk>
 <0518eef1-75a6-fbfe-96d8-bb1fc4e5178a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0518eef1-75a6-fbfe-96d8-bb1fc4e5178a@linaro.org>

Le Fri, May 20, 2022 at 09:57:26AM +0200, Krzysztof Kozlowski a écrit :
> On 19/05/2022 17:49, Mark Brown wrote:
> > On Thu, May 19, 2022 at 01:58:18PM +0200, Andrew Lunn wrote:
> >> On Thu, May 19, 2022 at 01:33:21PM +0200, Krzysztof Kozlowski wrote:
> >>> On 19/05/2022 13:31, Mark Brown wrote:
> >>>> On Thu, May 19, 2022 at 11:55:28AM +0200, Krzysztof Kozlowski wrote:
> >>>>> On 18/05/2022 22:09, Corentin Labbe wrote:
> > 
> >>>>>> +  regulators:
> >>>>>> +    description:
> >>>>>> +       List of phandle to regulators needed for the PHY
> > 
> >>>>> I don't understand that... is your PHY defining the regulators or using
> >>>>> supplies? If it needs a regulator (as a supply), you need to document
> >>>>> supplies, using existing bindings.
> > 
> >>>> They're trying to have a generic driver which works with any random PHY
> >>>> so the binding has no idea what supplies it might need.
> > 
> >>> OK, that makes sense, but then question is why not using existing
> >>> naming, so "supplies" and "supply-names"?
> > 
> >> I'm not saying it is not possible, but in general, the names are not
> >> interesting. All that is needed is that they are all on, or
> >> potentially all off to save power on shutdown. We don't care how many
> >> there are, or what order they are enabled.
> > 
> > I think Krzysztof is referring to the name of the property rather than
> > the contents of the -names property there.
> 
> Yes, exactly. Existing pattern for single regulator supply is
> "xxx-supply", so why this uses a bit different pattern instead of
> something more consistent ("supplies" and "supply-names")?
> 

I agree that supplies and supply-names are better.
But in another answer Rob is against it, so if I understand well, we are stuck to use individual xxx-supply.
I will try to create a new regulator_get_bulk_all() which scan all properties matching xxx-supply
