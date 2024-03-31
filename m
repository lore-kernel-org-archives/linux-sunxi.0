Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88015BB
	for <linux-sunxi@lists.linux.dev>; Sun, 31 Mar 2024 04:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711857981; cv=none; b=BL1U9Yi279ME1DuiqHR/8XbAMunNfOq9YPlwCXIgsAll83pZ8E3VBjh5yJ6Uc+xRkiBIP9t4HFkFxgOwNliN59r77S4o2AwHCJAwwC1aJVi+AIarSLQEEhs+p4gFK7wP9Vzx6NKIjjWOrGGj+DezGVgm3NJdRYluz2wNmAhnVy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711857981; c=relaxed/simple;
	bh=e3bRxDH+wQoPJin/nfB62E2/Uu/KG61lMcFAauOvRdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUtIxRFEpNk/v9KFhsh0tfPMTuoMf3BAMU2g5Bw2qKK1AZ6XamXtSTjAk52UEbngdcKYWZEPwSIYum7AMIwxpCeT4SNVk3Cf6f6CBqMn58ZijENIgxn14cGFT5FQCMWv89KnzPaRrCp5IO76QoiSMoJHZlRtdLm8YpVXK49APSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-515b43b39fdso2658369e87.1
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Mar 2024 21:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711857975; x=1712462775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3bRxDH+wQoPJin/nfB62E2/Uu/KG61lMcFAauOvRdw=;
        b=XBZw0/tCCGZw8yd6ZwMdCpkoGThXoI7zLeqdBcTdw84VmVsZ1sWRNq5+IaCxlhwKi0
         qSn0d8f/4SR/Jq8klzdmc0AsxgmW3eT3tqIzSHi+V1aKdsKT8nTKsL8WuXrCHAEjmwWQ
         HAZ+jTFjirfFBIYuJupwcfYmZgniJGTjxfLPgBpkmObkWMu/DZMcQuVZQtZhDKMMybz2
         NkGVk7Dj1E85FY9y5TPIX/RlS+VsiEfLEm5K+glyYN3dn7mHui237eS9pQRrOu8c54+G
         VzmQkG/l5krtn9UU6f13IuZOrgDgztM6Sy/tDpsSw355y46pLRE+kCLjtxSkbhRM5sIs
         bTKw==
X-Forwarded-Encrypted: i=1; AJvYcCVM28kRP39xBrQGji3etwFZnLjMxpv8SkuZ6IMZ7BMoI8rztuRN3YQ0V7jZp8xnCsfJOoOfFq7sUxGcBCYW7FbrkREqbFVcSKka/FU=
X-Gm-Message-State: AOJu0YxESAF65Ji1ZBN/o508PnbYRgZ01UeE5o7HjYMeZ/1EnJy1RdFA
	5sltL34FAagRvRYqHWbXmwOC0pQlMTSDt8JWnOAclwjwllsQqKbPV1HzHmZAdHc=
X-Google-Smtp-Source: AGHT+IHJVilozBTU3nhej8x8RaxDcsZB43iP0kmOWC3/qf+Vtf7YkZKi7fz193ju8kONx5Ws4KcsQw==
X-Received: by 2002:a05:6512:604:b0:513:9741:1cfc with SMTP id b4-20020a056512060400b0051397411cfcmr2239701lfe.18.1711857974880;
        Sat, 30 Mar 2024 21:06:14 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id u9-20020ac24c29000000b005169ee7cbadsm306208lfq.303.2024.03.30.21.06.13
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 21:06:14 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d4515ec3aaso25192411fa.1
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Mar 2024 21:06:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU90MIAlwN/VOz3yL1gCnh53/b16t7h5+8Ba83qZCypY0fwaFx20dZs4U+GafrjGfOJM8WJ3TibaOpB9ZICJ8uAGxNG8dqTGebK/vc=
X-Received: by 2002:a2e:a167:0:b0:2d6:b801:a85a with SMTP id
 u7-20020a2ea167000000b002d6b801a85amr2088014ljl.23.1711857973221; Sat, 30 Mar
 2024 21:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240330210954.100842-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240330210954.100842-1-krzysztof.kozlowski@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 31 Mar 2024 12:05:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v65vSm5i7qN4t7vsrMA1LpfLWmMBk7tbOXieQNk-egPYYA@mail.gmail.com>
Message-ID: <CAGb2v65vSm5i7qN4t7vsrMA1LpfLWmMBk7tbOXieQNk-egPYYA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: sun9i-a80-r: drop driver owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 31, 2024 at 5:10=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
