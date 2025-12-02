Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DFE3161B5
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Dec 2025 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684439; cv=none; b=NWXHhh/mRbzHPv/bcGK5aMyrugjo76pVV+aUWy5rH5+LR6Q5NdNL4Yiq8/6QzXoXYse5xMHr7cJVWU/k7KMIJStH4vIw9QWaUkMvz5ihYLKeZy1QyxPP9HrT8fvTbONod55U/09jEITA10VOGUXjDJuPGCGvSz0KiT0oBmyViPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684439; c=relaxed/simple;
	bh=vHUrQ6w324fYnCNxiHl4mdFInNGEkkrZLMojf3dBXGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keJWN9CllgCoX81yBw2ax7G83LqsMDNpReJ6kz9jsrFtGwEFvxtoUZRJ5swqvbIrvicDkT+0eva1H1qy9LOE6O04/YrGJ4HHygk26zqqZwqUcWSDiZ/UapWG2/NVihuijRixpsQ+6aH/yCOYYcd6P5M8MEmtPsvW9E19Joj7Mpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78a76afeff6so60829157b3.0
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Dec 2025 06:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684437; x=1765289237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P35uIC8+DPfTCMfHgmdtX7Glr2h/6n9nJWKZMAhyHf0=;
        b=tKihgPzU4oEOttm563kk/8ks9EkZSGHOunjkJwe4MwZMTGKrN0FK8mQZi3TtJhkItk
         mebQVIr+0E6AbpdFgmAII+PwiYph9MtDDAy8Gj+6ZVSHivACKMIy4Dt+LNtEetj4ZJ4F
         xFSnt+GRRReoYbtQ/HUeBHRZiUO9lIYPv1h/TmQ/NSLsmJdSAeQgvjFeRPTpwTD+sJEe
         P/tubQVdf/KXG4kUOOautunnLYl0OeBn34hmmpfN4AzuGHx9lVZZNxHL0jNUeKzl0v3G
         s6VM3wU65BnHJuJNzodroQD0eLFiLImzJqM7WETFTqGvjofzS4WxP5qckak4P1WexSRh
         a7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWjtZztOxZ8bDPnKlDhlk/DfdafaSbYgf0r3kEJZlKiC1v3zJNMWxD+zrsrtVk0wDtwA2nU22SE1xpyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyNSZzApwN8QlMSVL6JUoezGwWGpxJIlK5tXvgdYHMmNRf/q7A
	Lcnd9kdl2vNcTtfQb+hISG1uoKSUphQlUtOnpgbXKuEIgnf8citpAg/vVZa8dxB4
X-Gm-Gg: ASbGncvLRlQtAL6cQxOXyiw5EZW1xaJ02oUO5UFrv8dJ45vapwaoHDX6MR9zCdlHFfv
	yaLjmlf8YINg1xgouNxofgWf+azigqwchi0ErJamAR6lduxqtCXUeh7gwvOjXK208kN0Zb4/h8y
	mqCKH3/2foIuRARFMGTz2rWidmXux/T/uMoM8+hzr5i3tiqBd/i5GNk+WWZGip5k8fzLyFdwAEW
	hy0v9FS025JWqkb2iQlE9eXmxL6lBrhhcm+mG3NTkHENycv2NNa3HkZls94mdAXmIeHBJ70Xtwv
	DKEXEj/WmRSZXia5EHNUumqzn0M3VFNqC8QwJHnl6ipZnwcoegk6iV045Z+uw6RrRKa7TWoAtW9
	WbOmUThhfOD5TqsxxunjHVTXH2RCLBc8edh2OI+9hUkq1Xy/ScBPcSVKwukojKByeRDNXgcPQkb
	0BHJKOTz6HTcpn1349i0a9Acyq/dVA7Yj3fpMeZT8RH8h26NiZtMkA
X-Google-Smtp-Source: AGHT+IHxpSdikrbIE9lxGPlPh47aw6KsB+HJ+uFmhJ4dbxOdAgKs7RXfscZjpavYC6YASEu/dpF21w==
X-Received: by 2002:a05:690e:2501:10b0:63f:adfa:e5ff with SMTP id 956f58d0204a3-64302acca63mr26387693d50.57.1764684436483;
        Tue, 02 Dec 2025 06:07:16 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6433c48472dsm6184989d50.22.2025.12.02.06.07.15
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:07:15 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78a7af9fe4fso49433067b3.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Dec 2025 06:07:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2/TK3RcAXdeC//fKp8GWhVPda/y9ZSPcaSTMi8nNBGGtvxsdWA+2VP9ybjnlDI6g1yWtHiBoa/+Lgag==@lists.linux.dev
X-Received: by 2002:a53:dd48:0:b0:63e:17d8:d977 with SMTP id
 956f58d0204a3-64302abbb9cmr22209916d50.41.1764684434875; Tue, 02 Dec 2025
 06:07:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 15:07:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnQtK_C28o8ts-DX6QMHSfgR5FWBqGmuyp3cjxdu41cx4XkoPs5W_lQhYE
Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] of: Add wrappers to match root node with OF
 device ID tables
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your patch, which is now commit 4a93adcbd201aad5
("of: Add wrappers to match root node with OF device ID tables")
in dt-rh/for-next.

On Wed, 12 Nov 2025 at 11:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Several drivers duplicate same code for getting reference to the root
> node, matching it against 'struct of_device_id' table and getting out
> the match data from the table entry.
>
> There is a of_machine_compatible_match() wrapper but it takes array of
> strings, which is not suitable for many drivers since they want the
> driver data associated with each compatible.
>
> Add two wrappers, similar to existing of_device_get_match_data():
> 1. of_machine_device_match() doing only matching against 'struct
>    of_device_id' and returning bool.
> 2. of_machine_get_match_data() doing the matching and returning
>    associated driver data for found compatible.

Shouldn't the first function be called of_match_machine(), and return
a const struct of_device_id *, cfr. of_match_device()?

>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,53 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_device_match - Test root of device tree against a of_device_id array
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns true if the root node has any of the given compatible values in its
> + * compatible property.
> + */
> +bool of_machine_device_match(const struct of_device_id *matches)
> +{
> +       struct device_node *root;
> +       const struct of_device_id *match = NULL;
> +
> +       root = of_find_node_by_path("/");
> +       if (root) {
> +               match = of_match_node(matches, root);
> +               of_node_put(root);
> +       }
> +
> +       return match != NULL;
> +}
> +EXPORT_SYMBOL(of_machine_device_match);
> +
> +/**
> + * of_machine_get_match_data - Tell if root of device tree has a matching of_match structure
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns data associated with matched entry or NULL
> + */
> +const void *of_machine_get_match_data(const struct of_device_id *matches)
> +{
> +       const struct of_device_id *match;
> +       struct device_node *root;
> +
> +       root = of_find_node_by_path("/");
> +       if (!root)
> +               return NULL;
> +
> +       match = of_match_node(matches, root);
> +       of_node_put(root);
> +
> +       if (!match)
> +               return NULL;
> +
> +       return match->data;
> +}
> +EXPORT_SYMBOL(of_machine_get_match_data);

These two functions are very similar, but look different.  If the
former would return a pointer instead of a bool, the latter could be
built on top.

Even if you still prefer returning a bool, they could share a common
private helper returning a pointer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
