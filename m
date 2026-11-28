Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852940;
	b=Egi/yawIJ4e9cIlkEtw1eBtGkMJcCuMdLwAMaairVfjdnvixDuwNi59txzUqudIB871e
	 nqdMUCR7yaZLbUp94VqssH/33wh489vZAfnNaXnncG6dv2jw+YC5VI/41VytVE7f4nhQJ
	 tbWMVH1KAwJT81z8K8CCDo7DIj7YzjkcY6fTyVsPIfwvhUIujAQKv8QpjbLusP9oFk5/y
	 o+LKqnoF5e4K96lvaiOjXtL+7YexeOHhYk+VX/mthTxS6DyxLHzD52pAxzbHlQLr6XVnA
	 cFNRmhfLUBF4JeyMANSUzHOfzQT/pEGnnqJ/iQKiH9ZjV3gzzCmvBOmiomxpiMosGng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
	b=ISRWc6k8GBvNM+SqKgb4pvQuHbO52JZbghiXpKLyGYriE65mAahXaSIepKRhtWWnahpv
	 MESMNeVDGK7TMqzmj/S/QC8xxvke0YUB/pO2R1qB1BNPPwxydTbc1Xslb38UHL2U5cfnb
	 Sy5bFQCsizx6J0vvf4M1QJWyah4jJqAS5qyWVsZKtT5vfj7EjaYr/4SoeHSRxMRY15dTO
	 NZWM0q28uqTL4KK5o8xW34oRrvbO/ySgf1fM0XGsdLMznO1pJO5+WX296OpWxw4vYW3ul
	 CemLCsMkAbu0dEwBTTfnc+rBO6XqXf22goHtT5GPbSEsRco9hdZ3S02JCUvL3aRBhPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gCaO3NpC;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54747606A323
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Nov 2026 08:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54747606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gCaO3NpC
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso85154935e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 28 Nov 2026 00:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795852939; x=1796457739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=gCaO3NpCpspsL9MqmoXkgMA9rupUDwsy3U2JV8tTJFhBkxCTLgO5V/jnYxnrSHd6yR
         dJG9cfeRzhkvvx0/LiKFidQRitL1Ij+DjR1r8zZIy+eT02V43akAGC5p+URWPlzEzIvy
         0p0Y4QQA7G14S18uVOvgTni/XGLna4zfHuGSWf2h+5FwZT/+g4/ayn8Qx/jkxuQlUNqP
         fmJwiq7jLVCj3uY6cv/syccXkqvRxYnlIuDAnmqnyx8gw83kHkWWwzPQTVPHcgBOP32n
         B3zk54vNJWmwmeFg2GCl9e5aMIXU7T9sy9aNgZGvq+ow02/7LY1NKn7LTHCsFU5szizW
         NsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852939; x=1796457739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=zZ6Rb3RH5eJN0ERAtXtxOnf+0P3zIFddZYRDVaeduzuG4s1i//z90+dpkd82YTVDUK
         t9vCBoW9hLc4T+93LV/b+iLs+bnE9c4IeN8eQWSW3FrWtltF8XZwYpDH0CWgZQ4u5GW9
         /XXx+LIGSKinzwW6Wr/HmROR07zb9YC5zS9Ke7E3BNF3Om8IyoKakVZarrFiUtq6Hy36
         16NIPbEemW+Kx9p2vGfGmkjxxi2m7vi2feFzttLjtZBfasH1bNKsZLrJazM1tuWk3qXd
         ggcb6WflE5+rJ9PlOuwpdFPbhWuv/+aI8dqPIPAQNcFcqrukMqr6RCq1q8btrB1N0iG/
         0hJg==
X-Forwarded-Encrypted: i=1; AL+hErHoNabBrdK5+HY01Mp7H1uu8mODh8hopm8C+LP2+ivg4DB/FncSSbxr+2nqFWloeZQZsk568n98CoYdkA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8GYG803ONeZByiNAiU9kNEO5kwqjuZAbIZlo7ToDIo3uht96pk
	2m8ET3PG3o8Es54/oLRaipB/01hND8JiTidrAmsOkLXpCquVAH7cQPrLdv2RxzjLQ3Y=
X-Gm-Gg: AZFdTZefxXBf9CFxfPBTjhOTx71+PuJ+ncbZqCc6nAbVKEPczX1LrP7RvB+YbzTsJVU
	4A1QlNDXgEcnEZZobgunekZf2GqQceaxWufPLKO8tZ2nNQ+IqGNv71E0eoSdaq9U8PK+iTMQ4BP
	GjrzRg1gogK1ZWgPZ4fDkZtBMwwePkELFhO7xy1gX0+k7HTxBiOaHHKKLzn4Z7BBWOAs0zjh3X1
	kZxdNQl2Ups2fddaCnVWIw9yeIz5NXjNjAxaF6OJedxUHTBsFEOU0PKvvqnns2o9hu7cHeODfXy
	usdrWAVaj8aGizb9HGi1O3wbDbUSwk+BjFQHnhlTg58dzNcnPKpyA8CnkuRYvKe4nTJsuBNjgn5
	eekFqrAIhQlXOdT4GKKLK9c1rc1x27qmpdqeAuEOUoHYSuGICf1CWV45Kb5tDdBLVgUHrlsyDRK
	9rA4ioQ5JrkH+cdnoKfiQllV4oJq92Cc0AqaOU7zLU983v3AUcfdUa/IOY35nj/RIiFDMcEnCQG
	gSOseQwf3ONS+OW9YOFsiKw9plbLKYyn0XxzYohrLM2E2R8qFF/mWxuH0IbNOn0FrZ12MPLGNTf
	t+74RSWOhZHOAEThAqvG67SDOokf72wEgVL7Hn9jDhpSuQBb7jv8LOBTYYIBvEE6erp1ZCJrEow
	=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr505581765e9.9.1795852938637;
        Sat, 28 Nov 2026 00:02:18 -0800 (PST)
Received: from localhost (ip-005-146-085-079.um05.pools.vodafone-ip.de. [5.146.85.79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf680fsm59330195f8f.14.2026.11.28.00.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:02:17 -0800 (PST)
Date: Sat, 28 Nov 2026 09:02:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
Message-ID: <awqKD6EufgpjsjP8@monoceros>
References: <20261127073231.1776847-1-alastair@d-silva.org>
 <20261127073231.1776847-7-alastair@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6xgu3d2pgo3fouvi"
Content-Disposition: inline
In-Reply-To: <20261127073231.1776847-7-alastair@d-silva.org>


--6xgu3d2pgo3fouvi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 06:32:26PM +1100, Alastair D'Silva wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> provides of_device_id already without the
unneeded build dependencies that <linux/mod_devicetable.h> comes with.
So please drop <linux/mod_devicetable.h>.

There is no need to Cc: me for the next revisions of your series.

Best regards
Uwe

--6xgu3d2pgo3fouvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsKioUACgkQj4D7WH0S
/k7jYAf/QI/UwQ7qh2BbAqLJFatOOEv5i4Gi+vBVMqy7v16wMvrk3u7U4/ECqS/O
C2/R+NZfyAK6CTe/5t37K/v9LeyvsEN4IbMSK3b5rwXFErl5KgfUZIBdgbD/1BJJ
UP2X0g6ABsQZ5fNkNJXk8nerljU4Pxf7OUuWsz42+HHHKiq9AcZwAZgrS/TttgCN
xeKamMt2XFYPMdjOhAhO57r/l3qPChmlWbT2bDdzM4i9nTyLBXrDRghnJWItoaN4
puwi4x03yymrmDrp7IH2TYfNTOy/Lcc0OcjvpqxxhIG18CeOOMBMdMXQofE0HdQ6
Htyr2kbi6xiqECUEVFTnuPE7uy+hvw==
=iKhd
-----END PGP SIGNATURE-----

--6xgu3d2pgo3fouvi--
