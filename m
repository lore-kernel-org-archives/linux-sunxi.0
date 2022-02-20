Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D6E5EDC
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Feb 2022 21:07:26 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id p14so27968594ejf.11
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Feb 2022 13:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uOmlFrZp7vrKUK5Y6WvCp/ko6OikJNfPxlEXm5n9vhs=;
        b=lrFAbfCiFLIXi0LAKP1ZAq+lBoLcQ6stIxid43XCseni3F7GbnDlpbBpaePMPeT9hm
         E+ONQcfSghrEP1qf+qDGGdzIM41VHTCc7vN9dYcJ8AF52N2kfEsbGATNidU2ZG5Zgklu
         YXrPye0Nx3hQ32dqyaOjW2XzuHKWW+MQIIflqHYXPs5DAmBSLDpHaC5kGrdOMDxxePhX
         vww4Xz+fE5Qg6rNZb5DKj3CQOfZPh+YPMw0VFg+QdmIVIbxsDJdcOy1Badjsxydgj01Y
         4faDeRSEgD5qqNReV3tUNgdaaAJf+jVzcSKY8ZeJjXVKZt4yY78nQaTl4eHo+ALFxGQu
         jcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uOmlFrZp7vrKUK5Y6WvCp/ko6OikJNfPxlEXm5n9vhs=;
        b=bJ/9vl/1XuRuA3CNLaI/ov07tb9go5Pu+ql+AIO5q9BvlqmYiwNpzHscJEMzd1rCMr
         bHLKo4BezUYS/eVpBupLva5v7Bz0OR7JO74MpLjhBECCvQCeA1j7ovOEYIBPb10XWkVZ
         o5f+Sm7uVaDkOZRPCL83tMNauAsJ3R4xNzE0zJDIAfgqBEHZuz5v6WbZFJzSOUad7xgW
         TVUXFYGjL1UQm5atyCKHcqUPd1WwKo+EosUCfT1CSiBpdPmCieiCegA4ABGjRKIIL/Fr
         0YKN21pUY7kSzzgVSg0BAk3HpkybzaD9HrxdjS9rw3GqiRrmOrYoIspp8v7in//KxvL1
         WRMg==
X-Gm-Message-State: AOAM5307GlvYUdGRAbuIwoSxQKVEFLqCdeYnDgTbNdJ61nQqKuEQanMW
	MMxdX9YYNflFgBJqLKj5Rhk=
X-Google-Smtp-Source: ABdhPJyVabZx90O0oSxOrNaoDJGq9IKMVzfV8b/yQIMLwfip+pmFLLRmQZduqDULvxRnK9muJbuKaQ==
X-Received: by 2002:a17:906:14db:b0:6cd:e55:6605 with SMTP id y27-20020a17090614db00b006cd0e556605mr13571909ejc.31.1645391245320;
        Sun, 20 Feb 2022 13:07:25 -0800 (PST)
Received: from localhost.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id y29sm4508705ejk.199.2022.02.20.13.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 13:07:24 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	samuel@sholland.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] MAINTAINERS: Update Allwinner SoCs maintainers
Date: Sun, 20 Feb 2022 22:07:14 +0100
Message-Id: <20220220210714.2484019-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maxime is stepping down as a maintainer, I'll take more active role and
Samuel joined the team.

Maxime, thank you for your effort! Samuel, welcome!

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa0f6cbb634e..c41979623f82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1724,9 +1724,9 @@ S:	Maintained
 F:	drivers/clk/sunxi/
 
 ARM/Allwinner sunXi SoC support
-M:	Maxime Ripard <mripard@kernel.org>
 M:	Chen-Yu Tsai <wens@csie.org>
-R:	Jernej Skrabec <jernej.skrabec@gmail.com>
+M:	Jernej Skrabec <jernej.skrabec@gmail.com>
+M:	Samuel Holland <samuel@sholland.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git
-- 
2.35.1

