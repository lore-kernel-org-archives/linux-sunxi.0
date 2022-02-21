Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D24929A3
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 13:33:24 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id w18so7978625uar.8
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 05:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=FNR5T6Z01UkWpBHi+H4JVSGpKE3b3kPuS7Yn8CkS96s=;
        b=kvtaJlgtT5gNg09MnFT4k7zddi1Mo+OmYMCwKyBi/1TszZeoamzqT8OuBKpE0V89OH
         kxGG5ZPvSxsb+x7rNmApHstWT8Y+qx1irI//HlMNtMmdhbcvqW4nndb/Xwupk6H0vPpm
         Gr7ob7EDb7SEW7txuPqJhYK8BlbVkLFMewYhLKVrYQW3sqULUnAnpi9OD+1FL9Pa3hBr
         zDPGrxATTntKV8qTz7ucjfKCOeVb55CHe91xZib3GweD/fvt3VX0SQylgaplK4RqpWEu
         SZb3YzFawnXK09UeqJdduDXB/Pk1KfmLXPoK9VqtyrOWDTq726xrweobs9jZ1Nv+N1RG
         SH+A==
X-Gm-Message-State: AOAM531AB+7SpgtaSpVBqFFdH0j5XbpHR4OqOqPPOWo8kLisKqah17ov
	+W+zRCcs5JhpN/EKxeLre9fU9Yj6Cxm/GA==
X-Google-Smtp-Source: ABdhPJzs/RGWMA5TA1IgzPmUg+1HFgijXHchX4B9OO6ad5j94VZyD1bN7TaGOZG3uy+k59yMUTAxRw==
X-Received: by 2002:a9f:2142:0:b0:305:20b3:3585 with SMTP id 60-20020a9f2142000000b0030520b33585mr7293135uab.27.1645450403070;
        Mon, 21 Feb 2022 05:33:23 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id n131sm3344957vkc.11.2022.02.21.05.33.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 05:33:22 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id g21so17576828vsp.6
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 05:33:22 -0800 (PST)
X-Received: by 2002:a05:6102:956:b0:31b:1b52:ed9f with SMTP id
 a22-20020a056102095600b0031b1b52ed9fmr7911944vsi.28.1645450402349; Mon, 21
 Feb 2022 05:33:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220220210714.2484019-1-jernej.skrabec@gmail.com>
In-Reply-To: <20220220210714.2484019-1-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 21 Feb 2022 21:33:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v66AZaN5S025z8JxPJJXc_WM=a+YTzPwpyL-v_XP+wa3RQ@mail.gmail.com>
Message-ID: <CAGb2v66AZaN5S025z8JxPJJXc_WM=a+YTzPwpyL-v_XP+wa3RQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update Allwinner SoCs maintainers
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 21, 2022 at 5:07 AM Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
>
> Maxime is stepping down as a maintainer, I'll take more active role and
> Samuel joined the team.
>
> Maxime, thank you for your effort! Samuel, welcome!
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
