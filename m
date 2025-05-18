Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2A121CC4B
	for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 16:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586789; cv=none; b=igemRG14S5k8mSh0f0q+EiDaSnf+8y4YOymlKoJcDmUAWzuAWEFSXBz9T597dMSjo53KLn0Amqqby33J7w6TDROZZtthWB7NE5q5toDxlouoH791NK6UAY4r+8wSkT8rqK3ym7vY1Dutds2WN7zk62ncWdfRjYJNn98ydsF8XIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586789; c=relaxed/simple;
	bh=H8auBAsWmzOyx9AlQEKXQW3lYZT3R7zY1mzxA5CFuTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYWtulOE1kM56/+dNY/l6W83jClu4/dGaXrwDeQW97CV2GOh97AX0MFgMqvhMlRUpjnx+g7NrYFmXD6y5012/Cxgip+nu/v4ECXGPZIOYUTX4ifkTETdzmBV6DHHfG9oVddQUYDztYKbxgdD1K84BmVMtOE5xKisEK5FUaGjtJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3dc6f6530c5so1220235ab.3
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586783; x=1748191583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8auBAsWmzOyx9AlQEKXQW3lYZT3R7zY1mzxA5CFuTA=;
        b=lb0/5E+PQN4OiuO7SjzBcO7Yo3nC2wStPsERQPRo2kSHxOE9PrNQb456o7NRq3TmFD
         2X8B2ynA1xbE76+Y0+55o9oFlh3JFIyA42omnkC79TsmDxck1YB5mjss1lQdsJ1b2FHT
         HOvyLyKgKVNoobvY+4ojaj2KYXONJfXOj/UCrQRiUR40VMS51d1ptUMDTeJw05xa5A9E
         ANZS4uMuCSWbFntKBk0SqFy/26QPwVJyTHJ/1ipvuhQIxCsx3uUSxKlig6ZtR8As+qcg
         c8AX9Wn96lM+rpTEZ6Dyp+bHbUwW1mfUJcQyaSldUPQQe43GqQuMKZwPV5yFwRZDp5Bp
         DaHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj7sMlbXdYjVlE/dgXoK1F4XnloFs1IXlzwCmqDMr/Taz8QOSzWo5bFPx1IOp8EXoHwZLR9PAIus2czA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyTN0rECbB6EXNALINkA5c0Qbh1/muvNkYRflekE4V1SmHwarl
	HNjvGs4TQlxmFasBA8l006tvRHhfd6Wz+ddwRQS4gGAtcVXZY4Sm0X3f9652PyJUSzI=
X-Gm-Gg: ASbGncsuQ/FG/HPaHuCrI8m7WjMzw7JAttkDkghAMCms2Zbe72lPLOBvZ4o/mIYX4Q5
	pMPBZNAlwLzgHh1yJEBWxyk1cLhK/B04MRIiIvjJt1lu4hiyWXhUBqsDEL8LVcnSBsa8/yIyTdf
	OgjJdLRYqX8V/dyF5fg4djwTqhJ8pPyO53V0Ba48AoPK+bVUcB6oMgggQDRrbwYtRbdL7EsKkwl
	1Mk8+dLa6vDP+YDQ+GcPwrQlfBrsk4ZFXBGEVsr8vSVmZdqWxuQQCV+U7x4D8odMjUOqA6I8LDv
	SHmBxXKARapmxl0kfIld1rwVLDn7trs+yww/WhBQRdJEhdWA2QjSHAiQm9zd9xyzxFbzeVVmeCV
	KRjLlZrt6
X-Google-Smtp-Source: AGHT+IF8wpPf9sguclYM5N4px7xa/qMtrervEC7obA1v/LdVyMDvkpJEiG19FDWa3peU5zOc/IrGgQ==
X-Received: by 2002:a05:6e02:2592:b0:3d4:3db1:77ae with SMTP id e9e14a558f8ab-3db843313f3mr128768095ab.18.1747586783329;
        Sun, 18 May 2025 09:46:23 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4b1721sm1339871173.129.2025.05.18.09.46.23
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:46:23 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3db6ddcef4eso34891315ab.2
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:46:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQV1g3o/6VVFNQHQZPu/OUtn5l415mWHFpDq9SR0kAS3P7OVMCSvmASkmc/eVNT3ILKhWJ8iK0eq8YuQ==@lists.linux.dev
X-Received: by 2002:a05:6e02:3c02:b0:3d8:1dc7:ca7a with SMTP id
 e9e14a558f8ab-3db84296d9amr115461995ab.5.1747586782845; Sun, 18 May 2025
 09:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-8-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-8-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:46:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Lw9bne9Zch4kyAbWx4Zz=VPh3EJAta0M6XxdaSi-d7w@mail.gmail.com>
X-Gm-Features: AX0GCFt32y8vwGnO09UOLDY6RStkxid4HewGHZjKOLQgFiYtO_lDbLwjct7FmIQ
Message-ID: <CAGb2v66Lw9bne9Zch4kyAbWx4Zz=VPh3EJAta0M6XxdaSi-d7w@mail.gmail.com>
Subject: Re: [PATCH v11 7/8] drm: sun4i: de33: vi_scaler: add Display Engine
 3.3 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The vi_scaler appears to be used in preference to the ui_scaler module
> for hardware video scaling in the DE33.
>
> Enable support for this scaler.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
