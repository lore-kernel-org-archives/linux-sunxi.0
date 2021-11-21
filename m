Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8191B2C80
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 08:17:42 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id w23so30199846uao.5
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 00:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=YPdHw4igg7YGQnROWzeeN0m+U3heN/q62UEOUxqqzSU=;
        b=QRSvGaABstXW7Wu2cClhSOIc2VpgcALi+eqff+bpGRz16ZOY3YXC55inrPkjTYzAOW
         zPtG/0tL9yZxVIzJ7aIpger9b/8aA4t8Zg98CpVxYlndMrrS0AdFS2CM+DYS3k2tI3XO
         Ep+MeuQjRgYzgnW2RZWb45SpZSB40u+ZEUzwaUfzMFV6J8WELOOd189vLITBkXS2ZT7V
         C6HhxzwmJjYik3tgptYXinfFWp561K4+Aa9FxcZBNG28oWdJ7NxweERKSJ35TOwVfQT3
         k5r4ahBnisbzVg9ixbuN465+BHY6BzNsOc805TY8HNDk7CemcxUfHFLgAaixOb+VOZrN
         ToJQ==
X-Gm-Message-State: AOAM532rN/vQuI04pRjP/eXGBReQUR/I3Dhh8Qm0veuMeyhJ7G0bCrRH
	FIxDvVjguPe4CYj06vVuRv+wX2g2IG1V5g==
X-Google-Smtp-Source: ABdhPJwx4YCoT9Fm2tR4dCtCwpHqMPN/Qx5C1Ywfv2aiUBju1ZXYD99w1QGF/EPWJxdtj+vdNSMz+A==
X-Received: by 2002:a67:d893:: with SMTP id f19mr113470484vsj.39.1637482661387;
        Sun, 21 Nov 2021 00:17:41 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id q9sm2640751vkn.44.2021.11.21.00.17.41
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 00:17:41 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id n6so30262076uak.1
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 00:17:41 -0800 (PST)
X-Received: by 2002:ab0:4324:: with SMTP id k33mr71136243uak.43.1637482660900;
 Sun, 21 Nov 2021 00:17:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211121070321.601659-1-jernej.skrabec@gmail.com>
In-Reply-To: <20211121070321.601659-1-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 21 Nov 2021 16:17:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KpiW7s4BVTfiBRp1o=wM+CS5SBH1RT+2ZJP-ymtT4CQ@mail.gmail.com>
Message-ID: <CAGb2v65KpiW7s4BVTfiBRp1o=wM+CS5SBH1RT+2ZJP-ymtT4CQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: sun8i: h3: beelink-x2: Sort nodes
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 21, 2021 at 3:03 PM Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
>
> Nodes are not sorted alphabetically. Do it.
>
> There is no functional change.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
