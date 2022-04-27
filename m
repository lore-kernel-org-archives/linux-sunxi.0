Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4B33E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:36:45 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id p18so3116899edr.7
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=laBiheI0U75LASrHjB6ZdZZMpe4PBQO0pkzvkJ7BACU=;
        b=TulO57A6xlTWM81rj8A7o39sFF9xM0Zptw/Ml8zYreU+dZwZRnR37mY8wfAX69Pl5x
         vevGv03GOgpcWWfNg0fkxu0LbIduDQWkoWknoefGIPQIhjj+ibdDYYBUMWuivk8jQAZX
         63/1XotXCRd9FMUS9yENF+Yj6l/RTcc18WXBPonnB1mzsuflpIGQJqC6NzguPgUC1iVT
         zI2JPYKmsWvUT+1ARi8HHaDwhTnuwvobYjADNWNrlJInIY+fXpZ0HWzbUY6FWdZYZXWE
         BWc1FXpF1vITNBJvc8DEQ1QuA4XRar+hl/GkfpGhxN1K8aeiEkJKXahYYfF5idA70JE9
         AsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=laBiheI0U75LASrHjB6ZdZZMpe4PBQO0pkzvkJ7BACU=;
        b=AGvkJVY1eEDR4eSMVMZLpkPLkEwMhvbmVolMGvs9dwFDLiTF7qRji93EIgwXrp/Vb2
         8+3W5h7rpZxGgFkJi3RLsJY8g0B/1xuiPWnDkE8zr6RxwkxOloRjdETJse1mOY8/IBY5
         iVvikHq5EorRgk2tURKJ/AMKKH3/QMaT162d1V4SMDpElSLhPfHsuwQyzlxXhgcBPqg4
         cOqiw6Y52F+pCwrhUM7tsxZ3kG+aGEyjyrxVLarsdJTYxKh7BdQE1GE0sFLD1NiFBQvZ
         JhFjjBdOdop9I/trwrgxP3VzkgYZij/PaKoKbsfwwqtS173fFCyXehhO5wM4tlSA/JoF
         IZ1Q==
X-Gm-Message-State: AOAM533IZYlNXQH+rs7eyPKXfMnym02W24WxM73Gkr9bSL5APcU+I9dL
	eDJaF+tMjwgWOD/QnDkpY9Q=
X-Google-Smtp-Source: ABdhPJzUC30k74cycMu9f4Mp6MtRykBINJsEHSFD9PcJj5evGPN9Hbr/wtuK/7K6Ga/Tdb5i/Zq+ZQ==
X-Received: by 2002:a05:6402:d0a:b0:421:10e6:2ecc with SMTP id eb10-20020a0564020d0a00b0042110e62eccmr32710929edb.329.1651088203273;
        Wed, 27 Apr 2022 12:36:43 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id kj11-20020a170907764b00b006f3a41bbdeesm3811224ejc.38.2022.04.27.12.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:36:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 30/45] media: sun6i-csi: Introduce bridge format structure, list and helper
Date: Wed, 27 Apr 2022 21:36:41 +0200
Message-ID: <1787704.atdPhlSkOF@jernej-laptop>
In-Reply-To: <20220415152811.636419-31-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-31-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:56 CEST je Paul Kocialkowski napisal(a):
> Introduce a more informative format list for the bridge, with
> information about how to configure the input. This separation will
> later be useful when using the bridge standalone (without capture)
> for the isp workflow.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


