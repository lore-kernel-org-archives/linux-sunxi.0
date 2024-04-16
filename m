Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B4E12AACE
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713273791; cv=none; b=guVu9Fhk4C92qHXxfJqaoRFIGYs3Uy0y0+oGQkYujhjls2OZJ2at8qfdwSacWFbzvxwm6Hqpj9fw2tMHh84+tDYctNn5KNR8sRaa8kmdSVBnFASc7E8Exz6SjQZfGpLdsOK8Vcbf4Z3NvYCS4o/RKGPtej2cDkmL5MiJwpwBfro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713273791; c=relaxed/simple;
	bh=x6jfXcFRBti7KkgtfDl0XTo9aIOmY0FStdfCBjx7DUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f6ihw9rQz5ikc+utofR/Fl0c40Dov9itNyzgLItOVL+hzXAj3DbTPjvvEvJICnBKb8X9YWffiQYje1v7wwujxMzVGn0juDkqmPQGB2Ab74AYZ3JiRClCbdz6VbiSK3VSbnoDhoMNYTulrUd2bXFnGlPK4AaJpopPREct7TJbq74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqoc+GNd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqoc+GNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713273789; x=1744809789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x6jfXcFRBti7KkgtfDl0XTo9aIOmY0FStdfCBjx7DUc=;
  b=fqoc+GNdVX0FRwt25f34+hkpqpzU5APnFQqXb1hNWc3VrlkrXm5eS5Xv
   mqpE0OXyekULvWF7e9up6vrLQnnuTcO47Fonzt0QSc9OBItEUushtWO1B
   I2RgMuYZjLvyrHI7rd9jbCRhKMqzabkpVmP696gZXLpO/piF2jzWQsuYy
   HzOwfbRL0/5dOQsygKQ78xXnsRAqQ4CenTg2QyGNL+c9TK/BXFxDa6GTj
   FZvRQMqhRtU9BJqMhhsNHGHeLtBwqb47bVbFQVaF+Ws/py9JnPn8jxlaE
   Yg6FNiSDe0V0//vhoqHws9bR5f80Xo67pGhEg58GJyqAz5SKFPKQRUWgl
   g==;
X-CSE-ConnectionGUID: EQmsQJ1mRe+q6RwSuaMlLQ==
X-CSE-MsgGUID: n9jpLWd8TDiiEsg93ryUkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8571736"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8571736"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 06:23:08 -0700
X-CSE-ConnectionGUID: RZ3RKF8gQaSfe64ZnDVnrg==
X-CSE-MsgGUID: xxkEhbmFSTWJcooAB7if5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="53438742"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost) ([10.252.44.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 06:23:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 06/15] drm/sun4i: hdmi: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:20 +0300
Message-Id: <0967dde8ae35cd58ab8ea58397d514bb9df29fd1.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 2d1880c61b50..245b34adca5a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -214,20 +214,24 @@ sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
-	edid = drm_get_edid(connector, hdmi->ddc_i2c ?: hdmi->i2c);
-	if (!edid)
+	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc_i2c ?: hdmi->i2c);
+
+	drm_edid_connector_update(connector, drm_edid);
+	cec_s_phys_addr(hdmi->cec_adap,
+			connector->display_info.source_physical_address, false);
+
+	if (!drm_edid)
 		return 0;
 
 	DRM_DEBUG_DRIVER("Monitor is %s monitor\n",
 			 connector->display_info.is_hdmi ? "an HDMI" : "a DVI");
 
-	drm_connector_update_edid_property(connector, edid);
-	cec_s_phys_addr_from_edid(hdmi->cec_adap, edid);
-	ret = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+
+	ret = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return ret;
 }
-- 
2.39.2

