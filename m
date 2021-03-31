Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B646F
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 13:11:41 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id 97so6112686uav.7
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 06:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ZYBXfBFq9Pcqw/ubuL+75v+M+85JlEktYUVfnUAXl6s=;
        b=S6JBoboQm4fAXeSXeAqfD0BGhWA55Zs3s0uZZDE59ZhUVFF73c95sbcatzVxG7F1vn
         wWTakzdLz4dfFXS1Owhs8QGtd+FN8Fay4GLCMU+3hGhB7JiF/LHSKaT0BlNe79zcEjku
         4C4tKaR2TMmEyENd2ytQ1gplGdHUJyeoWQmABMWWCrkod5ygxq29wFAASPZpgifrbv+n
         R4rJbF57RUrOeiqbohddTqmbZdCLjS/HJ2nfWWfxoUt3THkZDWw8NFaq5i+QPyUegjDl
         JT5Du0eo7WClZvxtb0R35Hx9yZyvrnydN/ADE27atM8t+SRTX26w9OleQFt3uFC+5sgR
         Spag==
X-Gm-Message-State: AOAM533a8YY6d48hTzsBYQ/VmV/fJZ/f0QGinH+bLstO+goJSOH1VO0o
	kbAwX0an9XpSg42AQPBYUUCR0bTBwq0=
X-Google-Smtp-Source: ABdhPJxuHY+yGTQMTbaLWg4dlJ1OjYldV6OKyGAXi3Vxqrh4w2yI4NuMs4jztqOxyK3+AwcC7VJ5yQ==
X-Received: by 2002:a9f:3728:: with SMTP id z37mr1132070uad.89.1617196300102;
        Wed, 31 Mar 2021 06:11:40 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id f126sm277078vkh.4.2021.03.31.06.11.39
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 06:11:39 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id e1so6117435uaa.4
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 06:11:39 -0700 (PDT)
X-Received: by 2002:ab0:29cd:: with SMTP id i13mr1313599uaq.132.1617196299219;
 Wed, 31 Mar 2021 06:11:39 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210331130830.64182-1-maxime@cerno.tech> <20210331130830.64182-2-maxime@cerno.tech>
In-Reply-To: <20210331130830.64182-2-maxime@cerno.tech>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 31 Mar 2021 21:11:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v67C_jqFXNq-GzP+rAHiH9VHmnmg072wMa2eyVWH+-4Gsw@mail.gmail.com>
Message-ID: <CAGb2v67C_jqFXNq-GzP+rAHiH9VHmnmg072wMa2eyVWH+-4Gsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Match on allwinner keyword
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 31, 2021 at 9:08 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Some drivers (phy, crypto, net) folders don't have sunxi in it but
> allwinner. Add that keyword to match on it too.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chen-Yu Tsai <wens@csie.org>
