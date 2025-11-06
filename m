Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9514E2D6603
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Nov 2025 06:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762408920; cv=none; b=npzTFsdDl63QL1ETaAGlAVgcVfYCjsabjf0Ku4S9pILls5VTxYX0/2vDghYkc1Kd0TsyK5jOJ+kmwM0GHEFCaACo6za4SBTESn0iqCkxDa0qMOjDpl/HKJQIG9xBoLbpefff7YhmyXMibu53Nx0cEveVp+eg/ld3PRMDSTI+yUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762408920; c=relaxed/simple;
	bh=/EMy/K4xOqVd/TJc3X5qTwSIeGII2QmhmiESeAGTuis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idGp413CEzG9fwyu/mEF1DFz0FSLxg3PpZtSIm1cZgc1KkDu6z7xmZzHVbfKKJGCN1YgouhHtVU2C62I4H9eLERD+jX/XPVVnYCH6NsaLQLtv0Ds8nn0yPddU5Fv5KEY3wcASL7qMZ0KTeSMNY3ByMfHU5UwKljsJK2zLNGF7GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59390875930so833395e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Nov 2025 22:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762408915; x=1763013715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EMy/K4xOqVd/TJc3X5qTwSIeGII2QmhmiESeAGTuis=;
        b=ZSLwp3mXilXA3HNIXdW13TidWW7UyxsQp8fwI6fh9ZVJMUAGE8kKI5O+msQdsx/BTu
         RS2vCDGfvWNBF3oV1YAEPTi75g3AgT9Umem6avdPeIovJ2zf0O0Etq4ynWeGuIl9kGmw
         qlokoTgTH3pHRV1uuEm4PjBPghIujnYcPV+c8wtlZuMNtHBdnCgsLREHD9nT8Zg0CTUn
         lDr/oCbu7HONlFvh9b9z8ht/pu1hgB+moAs5gInY2DVXKCWAOi7eDD0MO51Ky5edlhOy
         AhZ090+cWycMtpubGxoVsSgM3X051dfDVajXuXjFBglBdavFt50olLy4Q4qdjBWheEeL
         LXCg==
X-Forwarded-Encrypted: i=1; AJvYcCXRuGIdD7bw1z1m9BqoF2ieDo3+k5ow0rpRS9oyh5gb5fXC5L4HI9ZXZWBZs6m/NVL1WSPJVDsW/NN5Ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQRwR5KPJVqhf14cqr7Mc/HKjPUsPoPQlCrmiNh5FTUMYsH0H8
	qV6g9dsvxLKK1sFNTfNAB+9qLqHhIldSRjJx9ln5q6ezm0Z8UOlF0ozrJrQZIQ==
X-Gm-Gg: ASbGncumUTXMDrd7vL//gUo6r9Em+J6xSTtWtQCUV/Uq05IteRdDPgdUyi8gBh9UQST
	DvN19kQhRCLZYXaDNtRB9hmUYOC0L0dtHkVqWnlhZGRYL1paAaWlFQ/375AynCOoIOomhl5eq4p
	pEVohtiY0E804F6BNY9ymvwcKq4dfraQjy5WVTrduoQy5oIUQW7bvoWreL+EtcYVlg2G1MQ1BR/
	hMHFVfHd4fNPFq+Tabl9Wavdhy1zJq+iXZKkr2/Un96gvevjXCxMf5ZDHhNkyHtSW1EbOozEmPS
	QElyMcuc+Cvzhy+0g3lvQRegbN7s47mKKU4T+dOKa+SBrk0DvXrckI9H7PgF9K0CpuS1hWgNLkS
	YuGOJ3isagsqXfS80khmFh0Yuel/DZhECvGIE8WhGlHsJPGjB5reoAJccR2ysBJ6FcuYtqrP+gc
	/EBkFk/dCph/cynA/UltXyulmKVws0/1cc
X-Google-Smtp-Source: AGHT+IF2HmfjprbL+b0+q44/l22+6n2PuhqMoyzAAldx6Hbs9ZdKsIwJkJ8cUsrd7Tg1dekzdSH2Gg==
X-Received: by 2002:a05:6512:61b3:b0:594:2d3a:ac3a with SMTP id 2adb3069b0e04-5943d7da333mr1869316e87.50.1762408914929;
        Wed, 05 Nov 2025 22:01:54 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0dc48dsm3770501fa.30.2025.11.05.22.01.54
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 22:01:54 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a34702a20so4889471fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Nov 2025 22:01:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzLcUlRinNlqrNxancPpTyBmC1n9N/G/8rxqarL9hLSbfJW5tchdYIAH+Hebz2q9DoG7V1bYPt7P6TCg==@lists.linux.dev
X-Received: by 2002:a05:651c:908:b0:37a:2d72:6119 with SMTP id
 38308e7fff4ca-37a51406a51mr16362171fa.21.1762408914469; Wed, 05 Nov 2025
 22:01:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704154149.3464461-1-paulk@sys-base.io> <aKhFPRP8ILNkKAvy@shepard>
In-Reply-To: <aKhFPRP8ILNkKAvy@shepard>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 6 Nov 2025 14:01:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v66=Ppqw+_fpAsRYd_4OBOhbHkk7RetfEXbYmvQ_+hoe7g@mail.gmail.com>
X-Gm-Features: AWmQ_blhZqLqx77LWLcKS7_dqP43aeZsGzE4L69w_GDVHcl80KjzuIFGb-55rnE
Message-ID: <CAGb2v66=Ppqw+_fpAsRYd_4OBOhbHkk7RetfEXbYmvQ_+hoe7g@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Cleanup v3s mixer config fields ordering and indentation
To: Paul Kocialkowski <paulk@sys-base.io>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 6:24=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi,
>
> On Fri 04 Jul 25, 17:41, Paul Kocialkowski wrote:
> > The v3s mixer config definition is a bit messy. Tidy it up.
> > No function change is intended.
>
> This patch didn't make it in the previous cycle.
> Would it be possible to pick it up this time?

I guess this is going to conflict with Jernej's refactoring / cleanup
series.

And, I think v3s is not the only one that has fields in a different order.
Might we clean this up after all the refactoring?


ChenYu
