Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB698EA0
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Jan 2023 16:40:12 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so8339129pjg.5
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Jan 2023 08:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XpDkZd3dMJw6LkEX0MBxH6n8ZwfUi8cETRYTv9eoejg=;
        b=pa2plTxq+IuvxLsMS02c5IZY7Ox5MmoPFHJQqkPyNaiuoHNXcLtu9wlWSdGNCaDLaA
         MImbE7xG2sNclierbhAPgAr+rOPJnqwvlDEI5MYuyKvv5hU0CRzbWDTi30SPN0hq4jau
         Fx00B6u7zmKsyADV60GqaWImRXlGRrXGdrOk2JIR2L93P2FxRztwmQQkfJhLjnq7h2JR
         IrOid5W1/ATGevYXqKdZ+M2z58mS5VpfXWm7xpyNdLaAB9gaGTbWb3pZQJ4l6/g92Tem
         rUDpQS98HfL3yal0wKC5ftn+Pbaz9bDxx1bz+k7xstV8nu6qVJSmngPjZWjA0IIp6QvR
         ztew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpDkZd3dMJw6LkEX0MBxH6n8ZwfUi8cETRYTv9eoejg=;
        b=bYuTRw+FfC5txux3V4UAeDYe7rDp2SZj79Ujpq0LUHDNuC7NTuR2+jiEyaejcIfSNF
         ud4WfzZoq723Y7Lms9i4z8i4JVD4RHiF3cBw1AP53M3egJjB4OamjXY5CG2DxsVQeny0
         QRjND+9JLkFTQVVTvorE0AHBRC9R2VV8iZJ2Td/NqXZJoABOUPZOilnbl22SN0BwYlBd
         K9Cq/BDrsvJB5dQ+Y6iZpGtHR2hGHWp6OeTD3SNgG58EZOD1e5yn4k3ViqRNkPkDsWLC
         mbv2nPzGhaPhGC8nN6HfV3vQ/vXwJHnf375t91fXK2ECd+FILgAQ+GdWYlswlARzRCQk
         74Vg==
X-Gm-Message-State: AFqh2krxNc2OMu7z3ZNJYJgrJitLTej5wkWx0TJueiMKtobt1tmSgRnO
	rPlMWV1KKNev/XWMAcj4EpL8x5J0m0SzIkx/Yhuz6tqh0beVrg==
X-Google-Smtp-Source: AMrXdXvaFDYwkjOAMGxjaw+ouFvSkC5KuRTktxmj1B6CZUqpfk+QgsSSG08c5R79kmzZ8Fh8cPTFyMR0ZqhuadV7xrU=
X-Received: by 2002:a17:90a:bd0e:b0:225:cd98:1651 with SMTP id
 y14-20020a17090abd0e00b00225cd981651mr4318338pjr.93.1673109611964; Sat, 07
 Jan 2023 08:40:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKAF0m9DqPjB6C39ZbrRHFrJOodm7WQGTL0x1jduQjNU=JpQ2g@mail.gmail.com>
 <d49cb79d-1405-c2cc-0c33-a768c5bbde91@sholland.org> <CAKAF0m984-tY+r+NXdND5hTHAQ55mk_XLjr2y+OBjKMNhS+e1g@mail.gmail.com>
 <8e7e9d95-a3c1-059d-1e13-20e69c23da46@sholland.org> <CAKAF0m-DQKBc-mfDsQESAA1NvZ1bAWfo-sp4tWqfWWaGhKUwww@mail.gmail.com>
 <6cffb621-8ba2-957e-9cbb-3b139448fd12@sholland.org> <CAKAF0m9SnNx=cutfGc7Mw+n6YLtrJQAP+kRe+VwX1WqRHiWbnQ@mail.gmail.com>
 <CAKAF0m9ym7-fUre3nBF195do_fhp1PGcmiDuyYoTwNO_Lzb0_w@mail.gmail.com>
 <CAKAF0m-cGuOxhzGKtxu_hiD2XJVPwjt53dF4WFAYuAK6VisgPQ@mail.gmail.com>
 <CAKAF0m-JVGH7dUGwWdFQQKT2UhTdpB4=h_u6H4Wbdux9_fQc6A@mail.gmail.com> <CAKAF0m9K=zqx1MOM1pZQY4_FOZxL8Svu0Vwn1+5FLn=whnD7aw@mail.gmail.com>
In-Reply-To: <CAKAF0m9K=zqx1MOM1pZQY4_FOZxL8Svu0Vwn1+5FLn=whnD7aw@mail.gmail.com>
From: Kirill <kirill.zhumarin@gmail.com>
Date: Sat, 7 Jan 2023 18:40:00 +0200
Message-ID: <CAKAF0m_6C68ox5z-NX1D6rjREgiySmSdxcda-KRvyehZssD5OQ@mail.gmail.com>
Subject: Re: ddr devfreq on H3 - possible?
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Now I use something like that. "Not great, not terrible" solution.
But, of course, not upstreamable. :)

https://github.com/Azq2/armbian_build/blob/h3-ddr-dvfs-patch/patch/kernel/archive/sunxi-5.15/patches.armbian/PM-devfreq-Fix-h3-support-to-MBUS-driver.patch
https://github.com/Azq2/armbian_build/blob/h3-ddr-dvfs-patch/patch/u-boot/u-boot-sunxi/allwinner-h3-ddr-dvfs-in-psci.patch
