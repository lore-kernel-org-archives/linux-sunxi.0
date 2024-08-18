Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D01E49E
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723988838; cv=none; b=S0R33iKZt+RzPwn57fO+5JUQN2pqWzmWhwKYnBkZc2isjTKbMG2i6L75yNo7DVNNDV3rqsaZ9qFTz0zUoYesrknKjnKIKg17Kwv4HLpRU96XXNyX7EjE4Lyvsbe+klMBZX2f9F5uMCrKVLcGaJPEMCcPt9lxG5c3GcLUHnV8DTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723988838; c=relaxed/simple;
	bh=jgt3v6Wp5x1kqvAC6kVKpKb1Tq0WHo9OEiRTHTbkMr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/5Tisc/Wmy/camrnKs+P8BdjujicfRoTqiNIdzzuZjqTZrSFGDQgnpZVrXJm+TniR5tqrHjX4wepx/yEvZrVRnUykFHs18vS1vyBEhDmhfcCk17fMCC+mOSCBCYSqgBsxiItTiXwatKkKBc9M20IHFHvC07/OqwrURw7zepJWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52f025bc147so4164370e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 06:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723988831; x=1724593631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uvtxgs6kWiB9/v6Xs7WCMNnd37h4d8Ese9LrJ+mZCI=;
        b=v4gMrDI6GPv8GA6u1ogekFlgAvczLtv/xh7mB/Fn/hBVjIrIrEyOkU7HbCFD9hPjKx
         YdQ5atb+2SETszDEhBMb5wnwVRjYpQSRZMJggv+4caAoyLh3veSIAXk8HZ2JNm/vz5Nq
         1kyv2Xk+8BvV81YOE52n1083RN2lJCc96Gj4OC/YFEOogDhx0wrT4I3q6UiIkOwf0zV3
         bSkxMx+6i98XV/A/O+j2lEDOO2AHJY4yjCgT2pEHU0i55wkL+96PSNpSZH1iIxtTljbx
         kmamvPXyebPa8uoZbcoBkqGaJGKCNXe3XRcAWwu065Bjv6c5ccgQAC3OjOf/BDJoir6d
         JqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkbIW4NGcIN35+B0oAY0f/sNEkAMGiGQWn5xuvrpa4gXgbqF4y9owdWrbODJ4oE4oJ+iR0IcBGj9zHCQzeHAyO6bqK+05Jhtp44Lo=
X-Gm-Message-State: AOJu0YxM5PSz9obVlq2oYHvvaKwefaeLNfzWmwsHjseZghKwUYE1o3+1
	z75S0uDroNnJr8X6DasN3/O1VNWdoaiVWTSrWGRjpvYPtzoILrv3+h1TfxWmdkc=
X-Google-Smtp-Source: AGHT+IEdbczZvWwj6auK3fTwM7KaB3+Rwa+tmVS22aa8d8WN7WigWO8cRKMJFProLXlODUsacA5piw==
X-Received: by 2002:a05:6512:2350:b0:530:aa82:a50a with SMTP id 2adb3069b0e04-5331c6e230emr6543068e87.45.1723988830928;
        Sun, 18 Aug 2024 06:47:10 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3afa5bsm1253058e87.32.2024.08.18.06.47.10
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 06:47:10 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3ce5bc7d2so9368431fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 06:47:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpq1HZ1cfhaPwxaDgmiXjh0m9Q7DCArfzluV5r/zmibLt7/ZqwFWA/WUpsbeslo7vdXK3ZktLmpnvRF9UBAVmQllJOR4Zq6EuykXo=
X-Received: by 2002:a2e:9a83:0:b0:2ef:1c0a:9b94 with SMTP id
 38308e7fff4ca-2f3be5864d9mr51081381fa.16.1723988830128; Sun, 18 Aug 2024
 06:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com> <20240817230503.158889-20-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-20-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:46:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v65_UGEJaqoUs8j9-wfsKKez_UPXTHnL3sj0ZA6NYt2vTQ@mail.gmail.com>
Message-ID: <CAGb2v65_UGEJaqoUs8j9-wfsKKez_UPXTHnL3sj0ZA6NYt2vTQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/26] dt-bindings: allwinner: add H616 DE33 bus binding
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 7:08=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>
> Add a display engine bus binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

>
> --
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
>
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-d=
e2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.ya=
ml
> index 9845a187bdf65..ea7ee89158c61 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,7 +24,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>
>    reg:
> --
> 2.46.0
>
