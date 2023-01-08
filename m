Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB1128F9
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 19:43:06 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id fc4so15218180ejc.12
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 11:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8y9U81icQc5CymJqCVNwmS2br5KE7MjRQmToRytln/U=;
        b=TeyAYieX6SiWKoHyEcjf8oabC/ITVVbpLSDqecBNKgMpfnMU+SXf7lJq0QFIjSnZp3
         okvL7+uUz69DfPUveXiluSx5hMuFvHlEVsg4UEXlF6qslEDN6B1icXt2x4jWoXm543ch
         kXLq3mfSJI8yAbyYBG1kej8gULczB7QPCZJQ2uIRYwJrhiZ5OPiuoFy+NyT+JLV5u7UB
         N2VTh3oITYNwZpz6jC9cYzPDmDbQ4cM2j1lJLC5ecWrVS/nv4UV7EzCE/+BWjBQU1Kzl
         PVIsPin/ObDqyKYPwq4ahWrfesB5IkVsPkFEQ0lL6zLu3yMUAcyfbPqT/x8P/AGfAnaS
         orew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8y9U81icQc5CymJqCVNwmS2br5KE7MjRQmToRytln/U=;
        b=q1QtyL1kXGOK6fBAPD92PxqiYVqqNqu5PtS8xqtH0nr5GRVGtqV3ISEFwpG9ZwGorD
         gfg2w7+DozChzHZtb2RGgMv84/XFrmzVyn9xx+paddILHyZ+W2Iel64AfSSXlua4jXwY
         ynU7N/tSSgFT7UMHfFmAhTyCPtf0+99rWfWbtjdI1pzX6mU3xlwYeA2GAnhzG2F9+avX
         ioomVdBhstDG/6p70a9fgyixcNJUQb2czY+oOItX3aHWJ8GEO9qiBdNO6RnvR1lZdlq2
         qVWNOc9RkowpqwutgHotSKuB12ucry55rEkzeNtB7E/fSU+ViotdaEBFVEbK6EUd5WSe
         BnjQ==
X-Gm-Message-State: AFqh2kpVOCirihVM0d9BJroTIQpN35Xiok0yjRGvar96MXxUuLFOgcOR
	9hI5aaUWhRj4wwfy5VmhV0UnsypNc2en6A==
X-Google-Smtp-Source: AMrXdXtUsksWth0ExwrvDVj11kAs1zImOH59i8k04fs2sSx5LdUhMM+u3csRML6CgOjcKRMOA36L7A==
X-Received: by 2002:a17:907:cc1c:b0:84d:207d:c008 with SMTP id uo28-20020a170907cc1c00b0084d207dc008mr6065742ejc.69.1673206984840;
        Sun, 08 Jan 2023 11:43:04 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id q22-20020a17090676d600b0084d42b9819dsm952055ejn.28.2023.01.08.11.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 11:43:04 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] rtc: sun6i: Always export the internal oscillator
Date: Sun, 08 Jan 2023 20:43:03 +0100
Message-ID: <2303942.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20221229215319.14145-1-samuel@sholland.org>
References: <20221229215319.14145-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 29. december 2022 ob 22:53:19 CET je Samuel Holland napis=
al(a):
> On all variants of the hardware, the internal oscillator is one possible
> parent for the AR100 clock. It needs to be exported so we can model that
> relationship correctly in the devicetree.
>=20
> Fixes: c56afc1844d6 ("rtc: sun6i: Expose internal oscillator through devi=
ce
> tree") Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


