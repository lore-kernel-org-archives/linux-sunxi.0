Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D67175BD
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Mar 2024 17:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709661102; cv=none; b=DPkR2Di+/UHVnBMsQC/Dnq/vYoWFTIqfOottl/1jK/tJv93wO44ktKtuF7Zuf7vnySud6xWMkxLtOEQVeRTFQ8v+cJYYIcMRrWDhIyXTt5I3hUVmI3BaBU/H5AMXQ6Xjm6VX4Qke81zMq2ORZYbV1R2X+6TlQo2O2qBYXILHeAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709661102; c=relaxed/simple;
	bh=2M9LS8/TFzVtINnbm0xitDXNpDBa5QKyfi1NFWuZEJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkghJ3jxZJbbDWs7xR25RtojeHoR6Z4MI8T0trcFiBH8h7isTYX7TRxbMj3LyuA/zeR/URNv/xV1P2+FoVYMUDej7SgV1z3CXUe/FpV/8VTXdVIX09D+1LTFKJprHq88MXGjUHtmumSRveZ3yyHDaX0qqZGLbUKjua0LpnN8w80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7s90o8y; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7s90o8y"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so8883a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Mar 2024 09:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709661101; x=1710265901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpTAtw3UQ93UxOybj4sot8nZNmiyYpy30JpPxTWnT6o=;
        b=h7s90o8yz/JCspbrSgxcMbrUjOVXnT0xiSzPu9UDM9nsyBR1Yf9wHWWR58NpSyz/c1
         i9e8iSYogpnRGLw3ZTTwsJGfVipmLg1qZYM7rdEBabNijTwn44Bl3j17eGbwuqfrQLmk
         aBBEynEWxUWQKmStz7j0ho2MUgER6fOROARIuQzMZV9H3MnI/0GwRZa7CgHMB56JMxGb
         ELZEpt6b2A9qt2UdzhsQCPR5GhOGLH26BRbJzdq5zvA2s6bcGCc7Wyun0pQh4DuATQ9a
         9esUdwhBXh/dLrcD28JPd0HGgyOulk2WBXHHe4C82riiJCr3TLNGRTIunNXZtWUo+82/
         wVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709661101; x=1710265901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpTAtw3UQ93UxOybj4sot8nZNmiyYpy30JpPxTWnT6o=;
        b=Vyni/VllFDDuDS4POIuSo3qYzJpc5UVG5UMK7UmhSU6nGZMXJhQufGtizoaXeGMfHX
         Bh6UcTBfL2gvI8g7Hd/k/VrtboLKBgDiJN9h+TvY4chHDcauCZh0AD/J186vNosncBHJ
         FPBohlU3LqK/1UK6QrQtTu6G2eUm1cbu8grFPYonwBmEgKuHLoBC6OlqFcei1uxMF+5L
         sN+omx//43aUzRBH03LKVyuu8KFqta2sYwpuqOH8g3qpjy/i788jZycYobTHgZmsaEOj
         u0m+u64pwQqMMb49TRncobIDfIxYUU++Sh4saabqmSPwN96AIPKhP5OdtcLd0fhvHoS3
         01+w==
X-Forwarded-Encrypted: i=1; AJvYcCUHV5MKfcBqxm3Vqj66y+Llr3zn1PYhOegMjhyCHRCEB2nO4Y/251fUn7XbWMX06w80RF9ruBlO6fpp5D6HmaPDLDHv2nKv0vvjYJY=
X-Gm-Message-State: AOJu0YyTEaXn1vw5wXo0doxaBXWIf/Wlsd71Ia0IUt0u5qowH+QVEnrE
	9W8s69xkE9QcMVBNuJ/9beBd9f9U7Xzko1TF8XX2kBd8f82yOw0A
X-Google-Smtp-Source: AGHT+IEXCEPMzLnaVufcdsnqvv3Px87pp8CIOt+QaL3umwskWU4qB01+4dyG4lax3qmGLdnMAoYDHQ==
X-Received: by 2002:a05:6a20:8428:b0:1a1:215a:335e with SMTP id c40-20020a056a20842800b001a1215a335emr3251417pzd.27.1709661100543;
        Tue, 05 Mar 2024 09:51:40 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:a5d5:fe74:fba8:86b5])
        by smtp.gmail.com with ESMTPSA id h37-20020a631225000000b005cfc1015befsm8377078pgl.89.2024.03.05.09.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 09:51:40 -0800 (PST)
Date: Tue, 5 Mar 2024 09:51:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: allwinner,sun4i-a10-lrad: drop
 redundant type from label
Message-ID: <ZedbqeNY23o8JzJb@google.com>
References: <20240226122934.89257-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226122934.89257-1-krzysztof.kozlowski@linaro.org>

On Mon, Feb 26, 2024 at 01:29:34PM +0100, Krzysztof Kozlowski wrote:
> dtschema defines label as string, so $ref in other bindings is
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry
