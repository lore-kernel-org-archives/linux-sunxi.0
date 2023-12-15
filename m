Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B02171A6
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Dec 2023 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p5aJh4IB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so319363f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 15 Dec 2023 00:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702630751; x=1703235551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4WNnW1NOB+fO7Mg7VbmdWzZX8Gi/hj8/iQQVYrLkFo=;
        b=p5aJh4IBsAB9aZfHIB0gIi1R4SHJZEeL9zSoWOIXQwiRzK4SJ1RJDiJ51xnSABIQRf
         133mf6ovhi5YfSrUeWiqVHWWsd+Yq5g26ufnHle3b/EDm8zfG23HCJuNqRboaftRyMrp
         JB8g3krmYF3fTX/UKHo5seisnyvk6i0aaiLb8Pdf04eBdRvv1SfGnoHpjXgUqeljTux0
         mPmJmrUCHlu6vtf/rKWSmvHzDxXlpXNM2wyX+/Ec4FE2P8LC9HexS/6hSN6xMuL0UU4l
         UfiknUVjrmIbCZiD+tNRJamD4i1ZGaiUuUp8bAVfIb+bdR+HLotT3R3M4wXH/AZPIq3q
         Io9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702630751; x=1703235551;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4WNnW1NOB+fO7Mg7VbmdWzZX8Gi/hj8/iQQVYrLkFo=;
        b=QYV5rFxzTjDlHwnw1IoXPyToyWzfUllWeLJMker02zmYGvhM8F/9+KpFYsWEzEPBmT
         ZQymLk3hDdPzzAQNC3arik+M0QqguDVN3rqztjdvESuj3h9urzar9HLehEMT85XsinU/
         7HuuLI9FmeovoscV2d5ErX+jF61Sn+/fgwYt9keUy5QdVJJVR5Zc71esptDXpXnJ4W1v
         9xNHSh41CJUtzaL3EkOf26cYbhRe6i/Mrqxuv5b4pW0MTLf47n+kKtG7uGmG99DNaY/D
         +Nv0VJMxz+FTlHfzQ/RfvxKnXnkpAT+SsanluXn6oeiO17iuaQ++1FdHEU+XhxcvnwDc
         K4HQ==
X-Gm-Message-State: AOJu0YxrJ9aUW3N2mN9rZykxf95q5Qyh1+oC2PpYWAOaM+kEqcnM74Zm
	vaMn2G4x4SEdUfENhfIfM8XmRQ==
X-Google-Smtp-Source: AGHT+IEboGQxDSRvg+eZ0u566TMxgE1PRMgtXrg9o17xozQrBEwE5qf8IjdFQqOGaJQkmuVK10ixdQ==
X-Received: by 2002:a7b:c8c2:0:b0:40c:279d:31a3 with SMTP id f2-20020a7bc8c2000000b0040c279d31a3mr5769544wml.176.1702630751467;
        Fri, 15 Dec 2023 00:59:11 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:95b3:332a:9768:b3f2])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c190800b0040c58e410a3sm10914972wmq.14.2023.12.15.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 00:59:11 -0800 (PST)
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob
 Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Johan Hovold
 <johan+linaro@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 kernel@pengutronix.de
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Date: Fri, 15 Dec 2023 09:41:59 +0100
In-reply-to: <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
Message-ID: <1jedfnq1sx.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wed 13 Dec 2023 at 08:16, Maxime Ripard <mripard@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> Hi,
>
> On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> Hello,
>>=20
>> clk_rate_exclusive_get() returns zero unconditionally. Most users "know"
>> that and don't check the return value. This series fixes the four users
>> that do error checking on the returned value and then makes function
>> return void.
>>=20
>> Given that the changes to the drivers are simple and so merge conflicts
>> (if any) should be easy to handle, I suggest to merge this complete
>> series via the clk tree.
>
> I don't think it's the right way to go about it.
>
> clk_rate_exclusive_get() should be expected to fail.

Yes, at some point it might. That is why the API returns an error code.
What CCF (or any other framework) should be no concern to the consummer.

Driver not checking the return are taking there chances, and that is up
to them. It is like regmap. Most calls can return an error code but the
vast majority of driver happily ignore that.

> For example if
> there's another user getting an exclusive rate on the same clock.
>
> If we're not checking for it right now, then it should probably be
> fixed, but the callers checking for the error are right to do so if they
> rely on an exclusive rate. It's the ones that don't that should be
> modified.
>

I'm not sure that would be right. For sure, restricting a to single user
was not my intent when I wrote the thing.

The intent was for a consumer to state that it cannot tolerate a rate
change of the clock it is using. It is fine for several consumers to
state that for a single clock, as long as they 'agree' on the rate. Two
instances of the same device could be a good example of that.

Those consumers should use 'clk_set_rate_exclusive()' to set the rate
and protect it atomically. Calling 'clk_exclusive_get()' then
'clk_set_rate()' is racy as both instance could effectively lock the
rate without actually getting the rate they want :/

Admittingly, the API naming is terrible when it comes to this ...

> Maxime
>
> [[End of PGP Signed Part]]


--=20
Jerome
