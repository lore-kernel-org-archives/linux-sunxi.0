Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E779CC
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723988893; cv=none; b=RBeZtpXAbIaU1+Lr921Q1BFAxwbMDMB+Np0DpyyMi7iGGS9ggD1+yH+eCFTIcLKg5Dfj9NLC0LXvo6xBSQkxQIu9o5A+A33X93mQSlETBZWEaPtipPoHChRKPh4bos28Dgx6Si5T/CpE12MWuVKpjlQrU+H0vwN4iOH3hch4hro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723988893; c=relaxed/simple;
	bh=086ANeHmrRDjdN2Mwc5Rp1d2iaH69nmzevA2WRPm9Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JV9w3F6dPDs2EiHqKLqllupJbqjRbwWdfFGqzX6c5iB19KpMn+WauSEzmpe0uC5ur0eddW0vaB8E6q7wxpby2N5YDvz3y9fqyDALaSj/WZy91IZWpDovL7sMa5/suPDV+ePdcXJN2fPLtVSqe9ungfYxZVmmjP8JL100pnZEGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f04150796so4167871e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 06:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723988886; x=1724593686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=086ANeHmrRDjdN2Mwc5Rp1d2iaH69nmzevA2WRPm9Xg=;
        b=iBxXJg59pqEUMP5oy+9TF+plQ5VFLDM1swyi7hgH7awwVtxhoiI1aaUmqN6Z3Ex03v
         xbSA58RMvJVnGTWBTSXmD8wD7ZaywfDsey6JuTsu29NRYMikLZfTkbtzEU3YHsrKzwR0
         0tszgg3FWzqfl1mXIFIEOYvaqIsmyj7AedAK1PmCV3XTtor1yYn2cy33Jt4iAc54gYgw
         AHKn/hi9Daeu8KJsTvhEgWKEcnffqEgFlPnSpynmU4TcsKi/Ezfawcpzmm4zRR7J5DK2
         X4zS7rHMjCso+InU0vCSB+vUaipoZG46zpi/5Z2/w4rkJzxB8yr70JlAXveKk6F/Xsea
         10pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQx45mbfKh2FoLq3uLY7SQr72SZFDvt80e6+tcdwoP+GCAahW4eG0hZcUqa2FUvL1eQXCOH/i8h5GwqGflbXoIjkyvwXfYAmEgDeo=
X-Gm-Message-State: AOJu0YyBsEE37dUBRjxotQPCVUABlE4C1yW8+CJgcsZguSwgP1b53r8I
	38l1ST0MCGi8tkChO3LQBhWIUy8TzRqdNjqXO/ChuQzDUXPf2mf+WWL2u+CHw+E=
X-Google-Smtp-Source: AGHT+IFred7+NCATXfucR53XypHXuu2aLrm9Hjc9v/lOyK92b2Yq0Y+ZBs5vya2Qb1/wJEuk0FE0Mg==
X-Received: by 2002:a05:6512:3a93:b0:530:ea60:7e07 with SMTP id 2adb3069b0e04-5331c6e97c0mr6132566e87.58.1723988885158;
        Sun, 18 Aug 2024 06:48:05 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3af971sm1211850e87.47.2024.08.18.06.48.04
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 06:48:04 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f15dd0b489so48774311fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 06:48:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyfym00CVfF/rt0LjQdW9W6PdwiDUBStBojCGFRVLm4u9tbPNqtYM2VT6GDsGDiOr6xwl37WXUPLXJSyJhQ58P+by4Bj6DsDeRo6Q=
X-Received: by 2002:a05:651c:2209:b0:2f3:bfcc:245f with SMTP id
 38308e7fff4ca-2f3bfcc27dfmr53848211fa.32.1723988884396; Sun, 18 Aug 2024
 06:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com> <20240817230503.158889-21-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-21-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:47:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v66d18WWQTu4YGsL8=qsRELKx675f+s8S1ezLj3eLmSmUg@mail.gmail.com>
Message-ID: <CAGb2v66d18WWQTu4YGsL8=qsRELKx675f+s8S1ezLj3eLmSmUg@mail.gmail.com>
Subject: Re: [PATCH v3 20/26] dt-bindings: allwinner: add H616 DE33 clock binding
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
> Add a clock binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
