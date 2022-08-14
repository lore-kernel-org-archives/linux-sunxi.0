Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E25A4E
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 06:46:05 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id qn6so8586223ejc.11
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Aug 2022 23:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RHfKLewiCmfaO7xL92FblVQuoV2hJPche3oawjnZYE0=;
        b=SfIOARkRKdqbh43SihXL3g1iqrt/NKkpis7l5JLJtmcZxp54LdwpAdXND7zPCW+NLX
         WqCdvPLjdVV+b+9Byix8rmAlG7QDoKApWtMBmMEGaUNVCfS72NBoLs2DFlkiNA6X+V99
         cHyLDQbmq/wp4OHVPhD8wz49V4wVaiZZdpaabP3sujpZ1tEdtESx/HpNZs/pIO0fm3dT
         5BQbb4EiSXyaIBUFNzTJCR6vZhnOMz16y4x91pYH6tl4s5ccNbSQQBIVA4nuPFRhvfBD
         ZCUBXD7nXFwf2UF0Pbw++BZ+RZR0LX+jBL48Kr2lyRSLUc0MBG3pWVYbCAfNxbiB3hOM
         c8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RHfKLewiCmfaO7xL92FblVQuoV2hJPche3oawjnZYE0=;
        b=D0obKmEtbnKJ2YhokNbDBPdKuHEvtcFg+QRYWmWsmqUZa3WMMxB+RBeASUvVDw3y7T
         6vxeY2eKQTOAAs6nSzc7f7ttJ49z5poRpnEpU0hOVphvlnBxzSBIAyxbrnR8/Smb7uiW
         9vhlE6+Ryc05Dr05Bw8qDO85R7+C4zH82YQpvm2rnNHTPhYFqQjBR6Zl86wR0qHabv9M
         kIUDm9cWtalD4F+NfVAAo+LNJ4O9YRFwV7LtX4ikwXRcVVdq3r9HJIsgZDmdwPqnCX/8
         QtB9aIG99F+QzlEzuU3zFEhHyNrqMRwDcoHVAtlNddrNC+9qtElSyn0rNXIyNEqpEPlj
         zxNw==
X-Gm-Message-State: ACgBeo2F2XvDt0xT7emHA/rsjcLd11cK/N5xhzCNISudSEK75yoKPb3E
	HDmaK4XgU+NP/FL22ZBl5dQ=
X-Google-Smtp-Source: AA6agR7t6L78m21I1kQ3RivP1OoGDtBwl7jBfRvIz0Z0V85VKMEnF9bfW9EaJZ19Be2eMGRU9EsORg==
X-Received: by 2002:a17:906:93ef:b0:731:1478:b774 with SMTP id yl15-20020a17090693ef00b007311478b774mr6748478ejb.531.1660459564169;
        Sat, 13 Aug 2022 23:46:04 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id e6-20020a170906504600b007306a4bc9b4sm2644920ejk.38.2022.08.13.23.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 23:46:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/6] media: sun8i-a83t-mipi-csi2: Add a Kconfig dependency on RESET_CONTROLLER
Date: Sun, 14 Aug 2022 08:46:02 +0200
Message-ID: <5847498.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20220812220045.800820-2-paul.kocialkowski@bootlin.com>
References: <20220812220045.800820-1-paul.kocialkowski@bootlin.com> <20220812220045.800820-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 13. avgust 2022 ob 00:00:41 CEST je Paul Kocialkowski napisal(a):
> The driver relies on the reset controller API to work, so add
> RESET_CONTROLLER as one of its Kconfig dependencies.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Please add fixes tag here and in the rest of the series.

Best regards,
Jernej


