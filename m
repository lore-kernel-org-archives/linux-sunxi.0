Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBC8199B8
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723988875; cv=none; b=SFL3ROfji7mhFdr9pc+/4wNv+EgfLRHP6afFtLXk31l/gNTIC/eAeYSUChXqZqi2k/fEwXaOv86t9+5VLxUSzg2KU3t3iHKTKP25rI4kCT5fR+ejUzaNvpnHlm8A8OM0yNS4AkKx5QGKuxdmTZq/yobR2ijdozOmL8p1dIVunBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723988875; c=relaxed/simple;
	bh=DOrE88eK7FNtec8CjcuF9Kbf1J+Xv+uNq/yKCjxMpHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FePvYh6VQGRe15Ic/vpyR1iWt1w2e+dXE2Es/oHjs5nLklT5jMTi6R3xf7qw4NKsC0K2xHYABMnJvfPFbnQDiaHLcKgsv9eZkPrhHJHkimVxWSKA9EHY5yTmFj+xMD5fnhvb1NMWJFzvwzyOp/eJVe96W9jQAoCQM+6wdQscbOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so38326911fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 06:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723988871; x=1724593671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOrE88eK7FNtec8CjcuF9Kbf1J+Xv+uNq/yKCjxMpHc=;
        b=D12EsS9xBAFl8O86LVZoDXlJzFT/5wSJqt9yKihjywqb/x06fq/lkvfn7ygEluN9Cl
         b/+keotD1jlVyKv+T/7IOqcrhg5HQSDTUpcoq97EimXAstjttDr9aPayhDUCGbySg9NW
         cslOH+wVvWcje4iCpsQiOYtok9pFyu2zueQA1m+EJ37lOYyEl0bf03m0JGSqweOKkUId
         gG66+qz9MiXeot/FnxS3LWqxVuFdbnUzP2UQ3nBwWsq8vt+vHQv9/YO19ODnlcGdACr5
         TguKppZCftvD/pNvJTSlwE/VZyO906+paGrCwRsMWIT+kEWRKlrPjcS0sEgV2+rZc7VW
         H80Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3nExeL8C5lbEpQlhO1/v43QekvjYf4L5lDdqVEd/nkGflpGKfLNpG1//JjD8Pfto4NLTjHOOhUxSX/qRen0lJ4+9CGDnD1CyS9Uw=
X-Gm-Message-State: AOJu0YxooXEjeVPpm6Z5GSw8pffCGXO3h8Th4wvBA4FWGkIuu4RFZ0Pc
	MYxZUFYzX0Lh/NGL5ybKS5xrmA4I62+Xds2Y4Lnn/fZsSzYjsNHDL4w/oJE2rrk=
X-Google-Smtp-Source: AGHT+IHZHE1pwZ1oXi1vOigERPLuyLIknUfSaPIiOxYgki0o9PWIp+hfyHXAzpRIGTKVDKxqDKw6kQ==
X-Received: by 2002:a2e:8098:0:b0:2f3:c82f:9ec6 with SMTP id 38308e7fff4ca-2f3c82f9f15mr34129561fa.12.1723988870399;
        Sun, 18 Aug 2024 06:47:50 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b719e741sm12064611fa.0.2024.08.18.06.47.50
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 06:47:50 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f3cd4ebf84so11133901fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 06:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLU3YEE8NCi8B36UMjpJxRUHRkXS9FR807zeOhZsZNmRCI+ZDXSCeTOU0wBs/7ALPtZSSvR6+dBuy5d9Ard10E2WXILRyBVEjeQ8M=
X-Received: by 2002:a2e:b8ca:0:b0:2ef:2dc7:a8f7 with SMTP id
 38308e7fff4ca-2f3be57e7acmr67887371fa.7.1723988869939; Sun, 18 Aug 2024
 06:47:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com> <20240817230503.158889-22-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-22-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:47:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65gppDuoUDNhWbZj5vVj7jNiPkiZLPisXK_PKQnPAr=_w@mail.gmail.com>
Message-ID: <CAGb2v65gppDuoUDNhWbZj5vVj7jNiPkiZLPisXK_PKQnPAr=_w@mail.gmail.com>
Subject: Re: [PATCH v3 21/26] dt-bindings: allwinner: add H616 DE33 mixer binding
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
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
>
> Add a display engine mixer binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
