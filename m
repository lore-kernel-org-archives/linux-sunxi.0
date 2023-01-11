Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988CE29B4
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Jan 2023 14:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C093C433F0
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Jan 2023 14:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673448867;
	bh=5991q1wXtvebgUykJ5NYVRTE1uZrMxXzr1nAKepdlS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LQWeU5VG/JImzmbaXmRaFlNv+qK912ckHmEpaO53u+xu0W9sgAX04JiV6A8YfPmJP
	 N3OWRrEDRXNSEvKTRqGIuOiM766jzVF6uiuTGqO6AWsIw/aVdYc/MPVuPhTGl7d65E
	 eeHNm3iVs2MF17RBqdS06relccnSyWOo+ii2uUuNPiBHYVpf6CCFOAwaDvzypJTgvc
	 9vsxfdvnB0hLoABSrAf0XXq1FkfVQA/0cWZnoxCAfwHRgIkFOWHkxsbCjn5lKaMI2V
	 ng4vsvD7+2Az4HuhqyWRHhJB0YPmKpXWx4DTsZMsI93oDh9+KsQMBxARRbUZxSVWDk
	 5I1M9waX80yTw==
Received: by mail-qv1-f50.google.com with SMTP id q10so10771951qvt.10
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Jan 2023 06:54:27 -0800 (PST)
X-Gm-Message-State: AFqh2kpOFcvzr3jLzbI6rUMVR6EWqaxqYB1ZmgU3d/7Dcw20wBL/rhhI
	Rirc7gADJVwr7T5vpP5SVk11JEXNRGAHIwIzlw==
X-Google-Smtp-Source: AMrXdXuLjGWkrJgzvCsRL34zMGz/o9XODdn1icG/0kwllXKQUYcQoLyaKOC+UHWHVBhznJfC3GM3r3lDlYFHXzS35BM=
X-Received: by 2002:a1f:1e50:0:b0:3c1:1c3b:c4d9 with SMTP id
 e77-20020a1f1e50000000b003c11c3bc4d9mr9659628vke.19.1673448856184; Wed, 11
 Jan 2023 06:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230111113018.459199-1-gregkh@linuxfoundation.org> <20230111113018.459199-2-gregkh@linuxfoundation.org>
In-Reply-To: <20230111113018.459199-2-gregkh@linuxfoundation.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 11 Jan 2023 08:54:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
Message-ID: <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] of: device: make of_device_uevent_modalias()
 take a const device *
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Frank Rowand <frowand.list@gmail.com>, 
	Liang He <windhl@126.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	Lyude Paul <lyude@redhat.com>, Corentin Labbe <clabbe@baylibre.com>, Zou Wei <zou_wei@huawei.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 5:30 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> of_device_uevent_modalias() does not modify the device pointer passed to
> it, so mark it constant.  In order to properly do this, a number of
> busses need to have a modalias function added as they were attempting to
> just point to of_device_uevent_modalias instead of their bus-specific
> modalias function.  This is fine except if the prototype for a bus and
> device type modalias function diverges and then problems could happen.  To
> prevent all of that, just wrap the call to of_device_uevent_modalias()
> directly for each bus and device type individually.

Why not just put the wrapper function in the DT code instead of making
4 copies of it?

Rob
