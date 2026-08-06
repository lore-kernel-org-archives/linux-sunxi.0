Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17573D8907
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Aug 2026 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001397; cv=none; b=dE+u0U9uRhozUm6X0M21424vH93HtPWoNKpNi/IFv4qX5aMzm4xhmxYM3xWko1DfBL9+4Za0aWTGBUOHVBXRuiN3bfs7Z1WkrQFw334aNN8s0TFwlxDDu/VU3EBti1al0a1vLINXEevX7L5AnR9smoIDI/j08okNTZvs6WY8F9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001397; c=relaxed/simple;
	bh=7dEfZ/MO7PfWW2b/sX7zrZr06DdtfX/8meGgTZKq7/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HgNhjV7SVHB0XXtPlXimws3IZcwOBOJo2HMKwemkj5QJKycojqkxYjyd9Bx2zJPNJG9SUjlZQxp3O8lsimqbQEiF33LDVf/q4FSI46K1spuqzX2LFPHDjiPXY9bkAJ+zZq4Y3dV9obLXVhj7ry1OK98IPXAby5kI8hCc/EkUM3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QzKaVDmy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QzKaVDmy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956242332dso14479345e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Aug 2026 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786001392; x=1786606192; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WpTrq3KT7PoBd2S/V9sh/mcnOd8WakjPdDWB72Qu55g=;
        b=QzKaVDmyx0AEX2MPozsUqi6RbCkVoHzlAQHSUVApVGrolQpVRDu/GoWDJRE3yXmZDl
         4+rkI9IV+33NQXGnutqPkSuUKWbEY16s845YlM4qCZT/kIbWZCIh0I+HdpI19IDd0tDp
         nIN+rnv5D5adEYWIu85Wx1ukpbpfGMS5Rarf28zcD5oZkIJD1NWMkJwEZIqPR7l/mqZV
         D01HqXUrPi4qjti1FZ41M7Sl0t9q37bAy60WzSV9+LZkybPKhVumLXMlbnzUGFYVXsF1
         XyeiXoGiUuO8MCo52F71aoyAY7HZlElqG4UftMT528E72j5EHqS4F3lOrZpn2H+Xlrll
         tNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786001392; x=1786606192;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpTrq3KT7PoBd2S/V9sh/mcnOd8WakjPdDWB72Qu55g=;
        b=aV+OEeC+him0okU9lxIpDMHH2b6b3nifooniwVn8Y3nDOpyfJZ4on5aPzq/YjY1Wqw
         L3NIlws8AeMbZYatQUFhCnMUIEtnefF3FcYoDv00LWikf1fLgvOD3lWCAgdW1bJhjKFp
         Kuzo3Vkrp78ahVfLQ/aV8pSOp7wya+e1naiA8J9lwoOo73cVwhh/KSnf6dKP7xyxZ4Pf
         rI/s/TVMlYgFT/cYmaA8Q1fdhyd8oGU869lKPJjSbb7AYCg5rqPeqJuDxpelqvu8OEeb
         fXEN+W+tsn7U7s3vvPn7gZWBQPNOkwGhEJgQN91AzWEWIWB+opor9nllWsoZvNILyPi5
         Dvzg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5YJPLZek9X45TOufvEy4vO8mrwoG+oktsN9tNz+r8Rq08Ki2li8bIrSRa3M8hlD6yJmC1DTtYh9lsFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNDAk8p35FqEUJfbncvRMB256QHrpzr43TLj+bK/935GpBmauy
	fA9q9YWv0GnDiNhFizJvs+UMdLXpGQ2FRVJ7zcDT4kYOPvi86ExLH6O/0WR1Yl2FsaI=
X-Gm-Gg: AR+sD13xL9PPvzbniJ87wClWVuTTGqgnZV8x1p3tNZVcv3RguZh9uqwG3ctYN+M1Zcp
	6fTSpGdL8Y91EZBy5DZMvb9Q1Dohvdxcz3nsyzjqrvLieFZJaEyHBMkZHF7JAowf4BKUHa0x96k
	8R8tUfNBdXNLmv821eX5OVIkmQz0OPSSlQ1M1oEG/jgkKxAr6VUyQn50WmjR7EFNE3lM9cok8rq
	IuaRYE6w9Fj0uuOFJaCnmWdVQjFlBvhpkyMNJvNltyAW1X2uY0P8BNxqAZNVepLEyxHgso8CuEA
	bf05Xy25Y1w81l/96BbBg48FVDZeYlK4V1Z2GWHuv1QvjGHg8Kjw+SPTEv5R6IRw0OKElW8rqiI
	2SjwP7pdhj9GP2u6syyxXA/grOFu0kmJ4Yu/ZKx4K4GSabOqh4dzzlm5fS8EY9ZXSl7wRjmzIgx
	D5wqL5/wz4Oc/Pb61eCEKHpfczMCB7+ubpHoAT49ah9JQHhUHoYcpTE1uZVq4=
X-Received: by 2002:a05:600d:6446:10b0:495:641a:bd3f with SMTP id 5b1f17b1804b1-4994e7c5d9amr144919805e9.13.1786001392307;
        Thu, 06 Aug 2026 00:29:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fc32:5991:4f4b:f361])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499542135cesm41789625e9.4.2026.08.06.00.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:29:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Brown <broonie@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
In-Reply-To: <20260805210739.6da82d16@ryzen.lan> (Andre Przywara's message of
	"Wed, 5 Aug 2026 21:08:27 +0200")
References: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
	<20260805210739.6da82d16@ryzen.lan>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 06 Aug 2026 09:29:50 +0200
Message-ID: <1jpkzvln9t.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 05 ao=C3=BBt 2026 at 21:08, Andre Przywara <andre.przywara@arm.com>=
 wrote:

> On Wed, 05 Aug 2026 15:53:26 +0200
> Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> The A733 has six SPI controllers with the same IP as the A523.
>> Like the A523, one of them (spi1) also supports DBI mode.
>>=20
>> Add SoC specific compatible strings, falling back to the A523 ones.
>
> Has this been tested? Can someone confirm? We should avoid adding
> bindings prematurely, not that it bites us again as it did for the H616
> DE bindings, for instance.

Yes it was. There is SPI-NOR on the cubie A7A. I did a quick sanity
check on it to verify it was functional (writing and reading back).
I should probably have added an note about that.

I have been submit a few changes like one lately. I'm doing that so we
can get on with DT as soon as possible, without waiting on the bindings.

I would normally submit the corresponding DT change at the same time
but DT is currently blocked by the main CCU and pinctrl.

>
> Cheers,
> Andre
>
>
>>=20
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 7 =
+++++++
>>  1 file changed, 7 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-s=
pi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
>> index 6af4ff233158..be47c6e00409 100644
>> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
>> @@ -36,6 +36,13 @@ properties:
>>        - items:
>>            - const: allwinner,sun55i-a523-spi-dbi
>>            - const: allwinner,sun55i-a523-spi
>> +      - items:
>> +          - const: allwinner,sun60i-a733-spi
>> +          - const: allwinner,sun55i-a523-spi
>> +      - items:
>> +          - const: allwinner,sun60i-a733-spi-dbi
>> +          - const: allwinner,sun55i-a523-spi-dbi
>> +          - const: allwinner,sun55i-a523-spi
>>=20=20
>>    reg:
>>      maxItems: 1
>>=20
>> ---
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
>> change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3
>>=20
>> Best regards,
>> --=20=20
>> Jerome
>>=20
>>=20

--=20
Jerome
