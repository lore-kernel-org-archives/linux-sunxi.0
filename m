Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2152A25949A
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735994937; cv=none; b=k2FIToqrirDUf7Kg0mOB1V6DRUp8bmnB4Hb3Ro92a9iA9PTDqCfX2MVQ10MaotNWdRGXb3jj1Z/7dg1WvjlMFIotSR28V7ZW+pAgox1B6NMm1cG1P8HUsbGj3tt5ugBc2IihSZcfaR8S0eLHgmUvd9UTH0qK3OLERkdZJnY8pvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735994937; c=relaxed/simple;
	bh=1h5pbeadn8aNEdeABkIevR/nrEaWCQQQ5wJXUYEJLR0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=jg8t8Sk76qrNUmVy8x/5jwqjDSSWTU0MqR/40ETyfaEV89AkfzlaSUQxnpJ0bym21VEk6uiutqgauYRVcAXkr/Wcj5TJ7eBsyj87cURmofyIvba1WbmE+uM1AV4vuyQMnV2OIOJaO18kUvraK6THqWzVVdhYzdQ2ThZXA9iEPeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=vjBvlbG1; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="vjBvlbG1"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1735994475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KG4fUCDLB9B6n/kj3zL/Wg8Xo2rnAPFIoEj566OdWMY=;
	b=vjBvlbG1nD7E0M5p3USHuQaGE4mr5D+BJMikzEwLmgmQILIYNR0L2Pmx4Xqp6rQmssdLsU
	zgNQ/IdjjjYC++qt95Pawo20CyW6NaidWdbMhq18BoMDTmJ1LvJV++155Xgcj2y3sI8HWB
	nieDGmvF1vPkRzeKm9c+fFfcCAM0JBJ+Mc87ry99r1g+PjleCWHopRsNYfe13MKc1z5zuf
	mX73/Q/uQ8uNyhsWYmOyExgA63zt8OGVYWv5txpJoJsn3n4XhKsVH0ZPBov1afhyMSoruz
	lhzpIu7aZW5h55GkSJ7Wz35BXOe/ka02NOim4B5mK7xLJB5YmofoCdG917YbEw==
Date: Sat, 04 Jan 2025 13:41:12 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, wens@csie.org, Vasily Khoruzhick
 <anarsoul@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Frank Oltmanns <frank@oltmanns.dev>, Stuart
 Gathman <stuart@gathman.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and
 PLL_MIPI
In-Reply-To: <20250104120256.65511a28@minigeek.lan>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
 <20250104074035.1611136-2-anarsoul@gmail.com>
 <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
 <ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org>
 <20250104120256.65511a28@minigeek.lan>
Message-ID: <65dfd7fd87fd2cd0a03f59fa23999830@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello all,

On 2025-01-04 13:02, Andre Przywara wrote:
> On Sat, 4 Jan 2025 11:33:23 +0100 Krzysztof Kozlowski <krzk@kernel.org> 
> wrote:
>> On 04/01/2025 11:23, Chen-Yu Tsai wrote:
>> > On Sat, Jan 4, 2025 at 3:40 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>> >>
>> >> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
>> >> select TCON0 clock parent in dts
>> >>
>> >> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
>> >> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
>> >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>> >> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
>> >> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
>> >> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>> >> ---
>> >>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
>> >>  1 file changed, 2 insertions(+)
>> >>
>> >> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
>> >> index 175892189e9d..4f220ea7a23c 100644
>> >> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
>> >> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
>> >> @@ -44,7 +44,9 @@
>> >>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
>> >>
>> >>  #define CLK_PLL_VIDEO0         7
>> >> +#define CLK_PLL_VIDEO0_2X      8
>> >>  #define CLK_PLL_PERIPH0                11
>> >> +#define CLK_PLL_MIPI           17
>> >
>> > You can't really split code movement into two patches.
>> >
>> > With this patch applied the clk driver will fail to build because
>> > the macros are now redefined in both header files.
>> 
>> Are you sure? The values seem the same to me... I don't see how this
>> could fail.
> 
> Yes, IIRC the C standard allows repeated definitions with the same
> value. And I definitely tested this before (and hence recommended this
> approach to Vasily) and it compiled without any warnings here.

FWIW, I also tested that approach when it was recommended, to make
sure that the C compiler(s) are fine with that.  And it worked. :)

>> > Barring recombining the patches, please add a patch before this
>> > adding #ifndef's around the two macros that are moved.
>> 
>> No, not necessary, just churn,
