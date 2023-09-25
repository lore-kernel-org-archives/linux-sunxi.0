Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07DB1EA87
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 15:07:50 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9b275afb6abso600429666b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695654469; x=1696259269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEZ5TYqKj7Xpyqh7LsqYS+cjUynAUZpYFGDV9Q2kYbI=;
        b=hzEiB7sYM9qhTSEpUWz/asZzXDMAMur5PwfPFR03jB1K98EgjQZh9thwfPs1UIuur9
         X1SR1HqqyLArMPw1rznq09O+xDYECYmZhX1i8dsrksfaDXJc2eVCYqNWD/IUALOc1sck
         stv3U9xp/jAYfrPguoiT4Yl/eY4VUcA3igCuKJvgLvICUELUdyX5Wi9iMa/pjAu9XYMM
         DMx8gbVVRkJVF+R1JBYl5xZJZ96Gr3D94+l8CU2ZFfwVO0xLGvcTywKfDAtRB4NO7hzt
         jin7KnGRHN9PXhR4eZ+FBzRVwwGG0wPbJhBDs4Bz94eTuZuNJAgrUq1B2yGn30vGJx7N
         +uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695654469; x=1696259269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEZ5TYqKj7Xpyqh7LsqYS+cjUynAUZpYFGDV9Q2kYbI=;
        b=qxacThGT8qn1xHUEWPWUvvzNAEH1Xx06vqN44VzJbKEEeIClIYeu7j9AOxS7HZuuvj
         0xqg6wOJ4TwKzP9xko99IVpwU/Itcq7oef7SIEo9gsuPLbBGZOzOhUPGXd1lR52tUQ8u
         0HiuKsVGet8mdVdH3IMnR3yAK5lIhVMd5SvMQesGp9Y0JBuZqXsZznor5uEGT0N001tI
         ASaZEKFdfAYo5xsrx3KbxGfAoyWjhnF085pF6ALQK2DYQy8XV6RBYQxM6qOYyuE+icZ+
         jY5vHzs/Ztq66EhkddkIqwH7K1jXt+5DiurAZA47Q0CRZ8tI0gkVkFEq9OxOQKKhQaXl
         cGwA==
X-Gm-Message-State: AOJu0YwKc8zWqXZKFPC7Zs5/tkGlcQOmuySzcXTXwIO6bcMUDrPc+V18
	ScPyLKlQQ8A9qF4+kmKz9+s=
X-Google-Smtp-Source: AGHT+IHuvDsUyVa2O8phaopW7XqF8puZjg9QRjHcigLXniRoG9KatTQvuRnfy0vTM9Vw7eaMxEcKbQ==
X-Received: by 2002:a17:907:7288:b0:9ae:50ec:bd81 with SMTP id dt8-20020a170907728800b009ae50ecbd81mr15679987ejc.21.1695654468639;
        Mon, 25 Sep 2023 08:07:48 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id s4-20020a170906168400b009ad829ed144sm6409010ejd.130.2023.09.25.08.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:07:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: wens@csie.org, airlied@gmail.com, daniel@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Date: Mon, 25 Sep 2023 17:07:45 +0200
Message-ID: <3441738.QJadu78ljV@jernej-laptop>
In-Reply-To: <rvqcfohw4i4y7amod3a5e4u4tkorqmaekvikyqg3fibvy53dsd@be4lk4ae35hq>
References:
 <20230924192604.3262187-1-jernej.skrabec@gmail.com>
 <20230924192604.3262187-6-jernej.skrabec@gmail.com>
 <rvqcfohw4i4y7amod3a5e4u4tkorqmaekvikyqg3fibvy53dsd@be4lk4ae35hq>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 25. september 2023 ob 09:47:15 CEST je Maxime Ripard napisal(a):
> On Sun, Sep 24, 2023 at 09:26:02PM +0200, Jernej Skrabec wrote:
> > There is no reason to register two drivers in same place. Using macro
> > lowers amount of boilerplate code.
> 
> There's one actually: you can't have several module_init functions in
> the some module, and both files are compiled into the same module.

Yeah, I figured as much. However, I think code clean up is good enough reason
to add hidden option in Kconfig and extra entry in Makefile (in v2).

Do you agree?

Best regards,
Jernej 




