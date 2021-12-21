Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD512C9C
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Dec 2021 12:33:55 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id o17so12686534qtk.1
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Dec 2021 04:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PRb2+biYRz+tifj2jXTfIb0511qliwqkvCVc/e674+s=;
        b=KAGNb75gWranBedQ0OOHTCdA/GRp7awXZJzsYnyHq+2z7I4KNYm4wt++TwpqQ4jTSo
         We/B9kqRFzFS2z0MSdEcbKdpeAjP6nEw3tDrBgNU0FcU2G9hcVc6YVelgnACex7YYL3C
         9yvqSH8M8Ssmn8PUarOQOddKq4T6OKTge/Oct38IfILq4P11FY/iUY3z6UnFzEq8gYY+
         KisrK8/SGAGU+MV060KX4+qXn/cZ1SRKv1162/q/gfQHEaarGpizYeD8Vej98QFwidp7
         mQCL34GO0K+Jm8zJSAam8u7RLi49uWX9m1LcR2taObR3AIo5AoZV6T1RG19605cPwb9g
         vIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PRb2+biYRz+tifj2jXTfIb0511qliwqkvCVc/e674+s=;
        b=dIfXECiIPus9k/mQjYtialwc9cXKHuF3x2Cl3OoBohwqEVsR2UFlKkEUhZeMhQlUOr
         yQ4UABtNbXVxmeG4lcqNlB7PGoT1b1ynccqH6AK37sqGUcsRUPJFIhzcObFwUsr4yxWi
         /NygBJSCuuY7JihNxAtLPi5eDktdp5KVTEKcDqr4rhwaBbqnZ5RKJAvzgR6So0jgAhcT
         k2Qt61AgP8URYEitM3GI12YyBivIgQtJrXGig3mPGM899llIW0kS0F8VKPZpYdwVcj/y
         kFPiNTbwupONbpgT3wnf+6Nra+ACd2gYFubwMz8ZmoFckb18XVzeuz4RGcL/CMG4cvvP
         glFw==
X-Gm-Message-State: AOAM533ls8MhIalLco8q+6C/NGIi0FSmrVS0B/FafyVHEYf06SmieSrL
	mKOl8H22T8O5ZZqVmqUHZo7vkfFJt2SrcxIqZQ+u6g==
X-Google-Smtp-Source: ABdhPJxcLyr8ljv9Q9dBtqLQefPD1HkvmcH0HRVsbIk1HMQukTuHmA8fLRpIsiljsrgoSRt6UIyDzbICxEAlCA0czQY=
X-Received: by 2002:ac8:4e8c:: with SMTP id 12mr1876205qtp.45.1640090034796;
 Tue, 21 Dec 2021 04:33:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
 <20211221101319.7980-2-jose.exposito89@gmail.com> <CAA8EJppMsqot1isnMYeSWVJm4tC-PoqUDL9jwd5HJ72tca0HQQ@mail.gmail.com>
 <9_OAfk8h0URTETEHMPKLX0zP7-pirLOCmv0iAiOCuRRcuuVRBjYBXk2YWAAogEANzumyffgjeRZD0nGtKTk5AeGdTLsN5Q7gVnQzr_x45WA=@emersion.fr>
In-Reply-To: <9_OAfk8h0URTETEHMPKLX0zP7-pirLOCmv0iAiOCuRRcuuVRBjYBXk2YWAAogEANzumyffgjeRZD0nGtKTk5AeGdTLsN5Q7gVnQzr_x45WA=@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Dec 2021 15:33:43 +0300
Message-ID: <CAA8EJpphECjTnr=EPaToxeqoQshSt-aF_41mEjO41GukZqbvTA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/plane: Mention format_mod_supported in IN_FORMATS docs
To: Simon Ser <contact@emersion.fr>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	freedreno@lists.freedesktop.org, jernej.skrabec@gmail.com, airlied@linux.ie, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org, 
	linux-kernel@vger.kernel.org, maxime@cerno.tech, tzimmermann@suse.de, 
	sean@poorly.run, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Dec 2021 at 13:50, Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, December 21st, 2021 at 11:48, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > I think the fix should be applied to the generic code.
>
> Related:
> https://lore.kernel.org/dri-devel/t1g_xNE6hgj1nTQfx2UWob1wbsCAxElBvWRwNSY_EzmlEe_9WWpq8-vQKyJPK6wZY8q8BqHl-KoGwS5V91VgN8lGIl3PJt7s2fkdsRd3y70=@emersion.fr/T/#u

I'd still suggest to fix create_in_format_blob()

-- 
With best wishes
Dmitry
