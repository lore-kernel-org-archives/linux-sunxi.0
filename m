Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0B55CD37
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Dec 2023 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="POHMgnGZ"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-db7d198e791so4126027276.3
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Dec 2023 03:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1702381242; x=1702986042; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0iUPBvo8eOmT//4vl8DQjGC5UmJmCx85Al5r4t/jUw0=;
        b=POHMgnGZibuYAiL+IN0cv5i0ypA53tdEJN91pLbcSwcFLRkr5rl21xQEB52WnN4dcl
         ENnhp1oevbqEohPHYTJ0CBK0/2xY3UYinSSEj+pXwh5fMQCTmXgQ87WZk88nTYrgTL1y
         K0YUd/ABo38tRbqBjqe+pimNLXhWIInRME6bKnbGF/GrKXQqu0PCjav0uLBOA9wmvShk
         8oSO2C7UVMdlddls9gH9ZH79MrF7xFAXWhLhgM4X3Xe6IfKKlvi/Ar8aLmBsieiHhcwn
         cgE3kRzsNOgSrD1NKkxzyTD6z/n/8G94yE+m3GQTIrTqk6eocgQ9JSQM7tulk+NpN4t4
         uAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702381242; x=1702986042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iUPBvo8eOmT//4vl8DQjGC5UmJmCx85Al5r4t/jUw0=;
        b=heCgDrFOOWBqpvkMHsRdsZ3Ao9S1iJBTGHxqkY+K6J5EAykHaU8Q0tgdoN1EUbOwM9
         hgq0S2YYy9Q0PvpeZhjyPW7ZvlssSXsGbDiaYBq6cumESq0OmSI7Sr+TD8iQESgGlrt5
         OMXeEi/3LgxHiOx20mPnIOEuNcifsbWkNmIHKnpMQcKUsuYTqfc3lc2+0BZxU8M+mnXp
         UXw8e6+W4q8VgF8g91XLC2zNbbGkl7YqEKLUrBE+78/AFVlNT+6LD3KjGwOj9HFnJd1A
         2DgtDMaaYDQeEGvHrkuAU9vlWFs7CdoIngDs279tH5E+SqYsDsEWp5s/wAbh0ir911zx
         jJSg==
X-Gm-Message-State: AOJu0YxYm1PtQMQLGn7TXRWHDNNfurzuHG+3LpQ1tR7VQivPNyNSogmD
	6TRzC5S1LuCj3jjeu5VAxPGnf7ItfrxH+qNZ0jrF9w==
X-Google-Smtp-Source: AGHT+IGkFxJXB+75F7npYS3Sl7fcGotb27eRrk6u5Q+tryG0nLGLjgw4n/C3z2I9FmEbcpAIdKRvpPS2VqJqFmY8cyo=
X-Received: by 2002:a25:ce8a:0:b0:db5:47ee:47c4 with SMTP id
 x132-20020a25ce8a000000b00db547ee47c4mr2442389ybe.53.1702381242014; Tue, 12
 Dec 2023 03:40:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org> <20231207-kms-hdmi-connector-state-v5-18-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-18-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 12 Dec 2023 11:40:26 +0000
Message-ID: <CAPY8ntBe9RfSjdnd5Smx23La5gQaR9WqY8ehXQyp=4D_11N55Q@mail.gmail.com>
Subject: Re: [PATCH v5 18/44] drm/vc4: hdmi: Create destroy state implementation
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
>
> Even though we were rolling our own custom state for the vc4 HDMI
> controller driver, we were still using the generic helper to destroy
> that state.
>
> It was mostly working since the underlying state is the first member of
> our state so the pointers are probably equal in all relevant cases, but
> it's still fragile so let's fix this properly.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 25c9c71256d3..f05e2c95a60d 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -672,11 +672,21 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
>         return &new_state->base;
>  }
>
> +static void vc4_hdmi_connector_destroy_state(struct drm_connector *connector,
> +                                            struct drm_connector_state *state)
> +{
> +       struct vc4_hdmi_connector_state *vc4_state =
> +               conn_state_to_vc4_hdmi_conn_state(state);
> +
> +       __drm_atomic_helper_connector_destroy_state(state);
> +       kfree(vc4_state);
> +}
> +
>  static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
>         .fill_modes = drm_helper_probe_single_connector_modes,
>         .reset = vc4_hdmi_connector_reset,
>         .atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
> -       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +       .atomic_destroy_state = vc4_hdmi_connector_destroy_state,
>         .atomic_get_property = vc4_hdmi_connector_get_property,
>         .atomic_set_property = vc4_hdmi_connector_set_property,
>  };
>
> --
> 2.43.0
>
