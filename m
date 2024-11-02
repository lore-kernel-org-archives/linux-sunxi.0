Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2366189BAD
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Nov 2024 11:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730548269; cv=none; b=dhL8Y8z+ueVNjJU//xk6yhXxQ1crfFJvJIME1bQQeMHn0Ry2K14XHACcittprBHsErk6Vm6jwL0rpCtaQxF/XuUdI4RJ/iFMAcbpn8xscwSu99TQlQURtCVL6cRW8jcyK4C7DnqaIANnoCappPvk+WRGEZFVDRByD7aDwFbIago=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730548269; c=relaxed/simple;
	bh=MtCxFhn9qQLXFwmCIV0k0ztAlVpN8badYhBgaQ4qWME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5deqeMJvEBtDRHoxKvCQxW0QoxVdihXfbFO8iCEwx62fr4eaBo6zt2V/b/UK5PiXyerwQcV/xNIQTrvEAWfYIs25+GcXbSAs8rZtF6rz/pog6HEWPJpppKf1Uuit3+VexgmJLI8OjjxR+RAhQb/AyDl/SLuhPiTxazbpBNa37E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53a0c160b94so3109218e87.2
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Nov 2024 04:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730548263; x=1731153063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HNxx58SAnxfm8WutwLtZrpYz0UwbZu8UhPuKwFhJ2Po=;
        b=KEBraCk0gpXaunxoVunOp3WgEDUE2A1QiuYhYQBNjlTG3kOK/VzKebhaD9Xpqh4rka
         iBr0VtjiDJeCaJzETKfXKLPtY1mZtAsTTBJwZCzIpLwvoQ1Xfwpb9oHccezRg4zpcaz6
         cuvf/KLspu3uZ3DTfAtWGsvGMcF75lmpbEQf8QsF0dYnq/c5Y/jUVdInS4ikk/y9Uc00
         ewb6TkcqFOU9R+uqL2NeC4WGWIihYy6Krtfg+Ppr0NDxbUk/wvpcCn3aP9JZfvF9lJ0W
         MfZQrW4W1j+/aHZ9WacYC0SMtYlEe2/87vs7a32SLuzVTk9Q0XRLpwvFlZdVSR4senST
         Nvvg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5h2maP3os+gBZv4JKcuQrT9xnCrRUA2m82DYN6vGSTS4KtLYzcWvARxY9QGgXEGKpxYKVf0kqW5Erg==@lists.linux.dev
X-Gm-Message-State: AOJu0YybaWD4QoWktRyHiNMN1bX37KWAfnRdMU1cAKWOs/5O3Ndt2FTx
	GI0H5/eK6npGVAOqy1qG0le308cccy6ZcNlFoA/nZ3PG99/GSbes76+qxErd1Jo=
X-Google-Smtp-Source: AGHT+IFrJhqo89h353FDoeqZRf3gmNNo+E/u4FT5cLbBcrX1RzonuXkoAhsTdSPgoBI3C8tqHDK7LA==
X-Received: by 2002:a05:6512:39ca:b0:536:55a8:6f78 with SMTP id 2adb3069b0e04-53d65df25e4mr2990471e87.17.1730548263074;
        Sat, 02 Nov 2024 04:51:03 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce4b3sm867640e87.164.2024.11.02.04.51.02
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 04:51:02 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb587d0436so31383641fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Nov 2024 04:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdGzOGJBSZPwLEOyerbtoF79ybV0E7wiKlTQIhPzUcwlUTmm5TeKEybnwdBzjhXEdnZdYGPOjHyN2SUQ==@lists.linux.dev
X-Received: by 2002:a05:651c:247:b0:2fa:ccae:d1d3 with SMTP id
 38308e7fff4ca-2fedb7a218amr36689791fa.11.1730548262188; Sat, 02 Nov 2024
 04:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest> <20241031070232.1793078-12-masterr3c0rd@epochal.quest>
In-Reply-To: <20241031070232.1793078-12-masterr3c0rd@epochal.quest>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 2 Nov 2024 19:50:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BtnCTCHnqpQrT=c8XRpr8UtpLK58DrWd9gv=tJjPHdA@mail.gmail.com>
Message-ID: <CAGb2v64BtnCTCHnqpQrT=c8XRpr8UtpLK58DrWd9gv=tJjPHdA@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] dt-bindings: opp: h6: Add A100 operating points
To: Cody Eksal <masterr3c0rd@epochal.quest>, Viresh Kumar <vireshk@kernel.org>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 3:03=E2=80=AFPM Cody Eksal <masterr3c0rd@epochal.qu=
est> wrote:
>
> The A100, similar to the H6 and H616, use an NVMEM value to determine
> speed binnings. The method used is similar to that of the H6. However,
> the information is stored at a slightly different bit offset.
>
> Add a new compatible for the A100.
>
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

Acked-by: Chen-Yu Tsai <wens@csie.org>

I assume Viresh will take this along with the cpufreq driver patch.

> ---
> Changes in V2:
>  - Fix ordering of compatibles
>
>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-op=
erating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50=
i-h6-operating-points.yaml
> index ec5e424bb3c8..75ab552f6ecd 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating=
-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating=
-points.yaml
> @@ -22,6 +22,7 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - allwinner,sun50i-a100-operating-points
>        - allwinner,sun50i-h6-operating-points
>        - allwinner,sun50i-h616-operating-points
>
> --
> 2.47.0
>
